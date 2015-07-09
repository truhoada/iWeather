//
//  ViewController.m
//  iWeather 2
//
//  Created by Nguyen Huong on 6/27/15.
//  Copyright (c) 2015 Hoang Trung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherStatus;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *Ctemperature;

@end

@implementation ViewController {
    NSArray *quotes;
    NSArray *locations;
    NSArray *pictures;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Gái gú là phù du \nThầy u là vĩnh cửu", @"Lớn phải có lông nách \nSống phải có tư cách", @"Ế trong tư thế ngẩng cao đầu",@"Học cho lắm tắm không có quần thay \nHọc cho hay thay hoài cái quần cũ",@"Bắt đầu ngủ đã tiết 3 \nĐến khi tỉnh giấc đã là tiết 5",@"Hận kẻ bạc tình \nHận cả gia đình \nHận luôn hàng xóm",@"Bạn bè có phúc cùng chia \nCó hoạ chốn sạch ở nơi phương nào",@"Nói tiếng Anh như gió \nGặp từ khó ta bắn sang tiếng Việt"];
    locations = @[@"Bacninh, Vietnam", @"Danang, Vietnam",@"HoChiMinhCity, Vietnam",@"Haiphong, Vietnam",@"Nhatrang, Vietnam", @"Hanoi, Vietnam",@"Bangkok, Thailand",@"Tokyo, Japan",@"Soul, Korea"];
    pictures = @[@"rain", @"sunny", @"thunder", @"windy"];
    // Do any additional setup after loading the view, typically from a nib.
}

int i=0,j=0, pictureIndex, locationIndex;

- (IBAction)refreshWeather:(id)sender {
    [_Ctemperature setText:@"C"];
    
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%i", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    while (i<=8) {
        locationIndex = i;
        self.location.text = locations[locationIndex];
        if (i==8) {
            i=0;
        } else {
            i++;
        }
        break;
    }
    
    
    while (j<=3) {
        pictureIndex = j;
        self.weatherStatus.image = [UIImage imageNamed:pictures[pictureIndex]];
        if (j==3) {
            j=0;
        } else {
            j++;
        }
        break;
    }
    
    NSString *string = [NSString stringWithFormat:@"%2.1f", [self getTemp]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    
}
- (float) getTemp {
    return 18.4 + arc4random_uniform(17) + (float)arc4random() /(float) INT32_MAX;
    
}

// Bai tap on luyen: Tac dong len Button "temperature": Chuyen tu oC -> oF

- (IBAction)btnTemp:(id)sender {
    if ([_Ctemperature.text isEqual:[NSString stringWithFormat:@"C"]]) {
         _Ctemperature.text = [NSString stringWithFormat:@"F"];
       
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterNoStyle;
        float cTemp = [[numberFormatter numberFromString:self.temperature.titleLabel.text] floatValue];
        float fTemp = cTemp*1.8 + 32;
       
        NSString *string = [NSString stringWithFormat:@"%2.1f", fTemp];
        [self.temperature setTitle:string forState:UIControlStateNormal];
        
    } else {
        _Ctemperature.text = [NSString stringWithFormat:@"C"];
        
        NSNumberFormatter *number = [[NSNumberFormatter alloc] init];
        number.numberStyle = NSNumberFormatterNoStyle;
        float fTemp2 = [[number numberFromString:self.temperature.titleLabel.text] floatValue];
        float cTemp2 = (fTemp2 - 32)/1.8;
        
        NSString *string2 = [NSString stringWithFormat:@"%2.1f", cTemp2];
        [self.temperature setTitle:string2 forState:UIControlStateNormal];
    }
}

@end

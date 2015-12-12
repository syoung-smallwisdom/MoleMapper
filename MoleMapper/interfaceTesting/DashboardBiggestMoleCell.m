//
//  DashboardBiggestMoleCell.m
//  MoleMapper
//
//  Created by Karpács István on 16/09/15.
//  Copyright © 2015 Webster Apps. All rights reserved.
//

#import "DashboardBiggestMoleCell.h"
#import "AnimationManager.h"

@implementation DashboardBiggestMoleCell

- (void)awakeFromNib {
    _header.backgroundColor = [[DashboardModel sharedInstance] getColorForHeader];
    _headerTitle.textColor = [[DashboardModel sharedInstance] getColorForDashboardTextAndButtons];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //_dbModel =  [[DashboardModel alloc] init];
    
    [super setSelected:selected animated:animated];
    
    NSNumber* avSize = [[DashboardModel sharedInstance] sizeOfAverageMole];
    NSNumber* bgSize = [[DashboardModel sharedInstance] sizeOfBiggestMole];
    
    float avRounded = [[DashboardModel sharedInstance] correctFloat:[avSize floatValue]];
    float bgRounded = [[DashboardModel sharedInstance] correctFloat:[bgSize floatValue]];
    
    NSNumber* biggestScale = [NSNumber numberWithFloat:1.0f];
    NSNumber* averageScale = [NSNumber numberWithFloat:(float)[avSize floatValue]/(float)[bgSize floatValue]];

    //set average from model if there is any DEBUG
    //NSNumber* averageScale = [NSNumber numberWithFloat:6.7];
    //NSNumber* biggestScale = [NSNumber numberWithFloat:9.2];
    _innerCircleLabel.textColor = [[DashboardModel sharedInstance] getColorForDashboardTextAndButtons];
    _outerCircleLabel.textColor = [[DashboardModel sharedInstance] getColorForDashboardTextAndButtons];
    _innerCircleLabel.text = [NSString stringWithFormat:@"%2.1f mm", avRounded];
    _outerCircleLabel.text = [NSString stringWithFormat:@"%2.1f mm", bgRounded];
    
    [[AnimationManager sharedInstance] scaleUIImageWithImageView:_outerCircle withDuration:0.4 withDelay:0.3 withPosFrom:0.0 withPosTo:[biggestScale floatValue]];
    [[AnimationManager sharedInstance] scaleUIImageWithImageView:_innerCircle withDuration:0.3 withDelay:0.3 withPosFrom:0.0 withPosTo:[averageScale floatValue]];
    
}

@end
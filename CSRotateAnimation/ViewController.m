//
//  ViewController.m
//  Rotation
//
//  Created by jared on 16/5/11.
//  Copyright © 2016年 jared. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 1次旋转的角度,决定速度快慢,越小越慢
#define kRotateOnceAngle    (M_PI/11)

// 旋转时间 注：1秒转11次，可调整1次旋转角度来决定旋转停止时图形的位置
#define kRotateDuration     2

// 旋转圈数
#define kRotateCount        3

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (nonatomic, assign) BOOL stopRotation;
@property (nonatomic, assign) int  count;
@property (nonatomic, assign) BOOL isAnimating;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)begin:(id)sender
{
    // 设定旋转时间--打开这个注释
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kRotateDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        self.stopRotation = YES;
    //    });
    
    // 设定旋转次数--打开这个和下面两个注释
    //    self.count = 0;
    if (self.isAnimating) return;
    self.isAnimating = YES;
    self.stopRotation = NO;
    [self rotate];
}

- (void)rotate
{
    if (self.stopRotation) return;
    //    if (self.count >= (M_PI*2)*kRotateCount/kRotateOnceAngle) return;
    [UIView animateWithDuration:0.1 animations:^{
    //        self.count ++;
        self.imgView.transform = CGAffineTransformRotate(self.imgView.transform,kRotateOnceAngle);
    } completion:^(BOOL finished) {
        [self rotate];
    }];
}

- (IBAction)stop:(id)sender
{
    self.isAnimating = NO;
    self.stopRotation = YES;
}



@end

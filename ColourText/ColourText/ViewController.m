//
//  ViewController.m
//  ColourText
//
//  Created by 从来 on 16/12/13.
//  Copyright © 2016年 从来. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CAGradientLayer *grandientLayer;
    CAGradientLayer *gradientLayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
//    [self createUIs];
}

-(void)createUI{
    UILabel *textLabel = [[UILabel alloc]init];\
    textLabel.text  = @"我是一个勤奋的乖宝宝哈哈哈哈哈";
    [textLabel sizeToFit];
    textLabel.center = CGPointMake(200, 300);
    [self.view addSubview:textLabel];
    grandientLayer = [CAGradientLayer layer];
    grandientLayer.frame = textLabel.frame;
    grandientLayer.colors  = @[(id)[self randomColor].CGColor ,(id)[self randomColor].CGColor,(id)[self randomColor].CGColor,(id)[self randomColor].CGColor];
    
    [self.view.layer addSublayer:grandientLayer];
    // mask层工作原理:按照透明度裁剪，只保留非透明部分，文字就是非透明的，因此除了文字，其他都被裁剪掉，这样就只会显示文字下面渐变层的内容，相当于留了文字的区域，让渐变层去填充文字的颜色。

    grandientLayer.mask = textLabel.layer;
    textLabel.frame = grandientLayer.bounds;
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(textLabelTextChang)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    
    
}
-(UIColor*)randomColor
{
    CGFloat r = arc4random_uniform(256.0)/255.0;
    CGFloat g = arc4random_uniform(256.0)/255.0;
    CGFloat b = arc4random_uniform(256.0)/255.0;
    return  [UIColor colorWithRed:r green:g blue:b alpha:1];
}
-(void)textLabelTextChang
{
    grandientLayer.colors = @[(id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              ];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

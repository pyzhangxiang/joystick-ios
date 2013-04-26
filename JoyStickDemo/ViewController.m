//
//  ViewController.m
//  JoyStickDemo
//
//  Created by Zhang Xiang on 13-4-26.
//  Copyright (c) 2013年 Zhang Xiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    playerOrigin = player.frame.origin;
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver: self
                           selector: @selector (onStickChanged:)
                               name: @"StickChanged"
                             object: nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onStickChanged:(id)notification
{
    NSDictionary *dict = [notification userInfo];
    NSValue *vdir = [dict valueForKey:@"dir"];
    CGPoint dir = [vdir CGPointValue];
    
    CGPoint newpos = playerOrigin;
    newpos.x = 30.0 * dir.x + playerOrigin.x;
    newpos.y = 30.0 * dir.y + playerOrigin.y;
    CGRect fr = player.frame;
    fr.origin = newpos;
    player.frame = fr;
}

@end

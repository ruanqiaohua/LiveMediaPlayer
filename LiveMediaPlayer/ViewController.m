//
//  ViewController.m
//  LiveMediaPlayer
//
//  Created by ruanqiaohua on 16/1/19.
//  Copyright © 2016年 ruanqiaohua. All rights reserved.
//

#import "ViewController.h"
#import "KSYPhoneLivePlayView.h"
#import "CommentModel.h"
#import "SpectatorModel.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (strong, nonatomic) KSYPhoneLivePlayView *phoneLivePlayVC;
@property (strong, nonatomic) NSString *videoUrlString;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置后台音频播放
    [self settingBackgroundMusicPlayer];
    //流媒体播放
    [self playVideo];
}

- (void)settingBackgroundMusicPlayer {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

- (void)playVideo {
    self.videoUrlString =  @"rtmp://live.hkstv.hk.lxdns.com/live/hks";
    _phoneLivePlayVC = [[KSYPhoneLivePlayView alloc] initWithFrame:self.view.bounds urlString:self.videoUrlString playState:KSYPhoneLivePlay];
    [self.view addSubview:_phoneLivePlayVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  WrittingViewController.m
//  NetworkMiniProject
//
//  Created by HanYoungsoo on 2017. 3. 17..
//  Copyright © 2017년 YoungsooHan. All rights reserved.
//

#import "WrittingViewController.h"
#import "DataCenter.h"
@interface WrittingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLB;

@end

@implementation WrittingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)onBackBtn:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onWriteBtn:(UIButton *)sender {
    NSString *token = [[[DataCenter sharedInstance] userdefaults] objectForKey:@"TOKEN"];
    NSLog(@"%@",token);
    
    UIImage *myImg = [UIImage imageNamed:@"91030922.jpg"];
    NSData *img_data = UIImageJPEGRepresentation(myImg, 0.5);
    
    NSDictionary *contents = @{@"title" : @"영수의 글" , @"content" : @"영수가 쓴글이예요!!!" , @"img_cover" : img_data};
    
    [[[DataCenter sharedInstance] nManager] contentsPost:token contents:contents completion:^(BOOL isSuccess, id response) {
        
        if (isSuccess) {
            self.resultLB.text = @"글 올리기 성공!";
        }
        else{
            NSLog(@"실패");
            self.resultLB.text = @"실패 ㅜㅜ";
        }
    }];
}

@end

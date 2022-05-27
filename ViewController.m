//
//  ViewController.m
//  DynamicTextfield
//
//  Created by Kelbin David on 2022-05-26.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *dynamicTextfield;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  _dynamicTextfield.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
  
  NSLog(@"%@", string);
  
    NSString *currentString = [NSString stringWithFormat: @"%@" ,_dynamicTextfield.text];
    NSArray *words = [currentString componentsSeparatedByString:@" "];
    NSMutableAttributedString *finalString = [[NSMutableAttributedString alloc] initWithString:currentString];
    NSInteger startRange = range.length;
    NSMutableArray *ranges = [NSMutableArray new];
    for (NSString *word in words) {
      if ([[word lowercaseString] isEqualToString:@"red"]){
        [ranges addObject: @[ @(startRange), @([word length])]];
      }
      startRange += [word length] + 1;
    }
  
  for (NSArray *range in ranges){
    [finalString addAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} range:NSMakeRange([[range objectAtIndex:0] integerValue], [[range objectAtIndex:1] integerValue])];
  }
    _dynamicTextfield.attributedText = finalString;
  return YES;
}



@end

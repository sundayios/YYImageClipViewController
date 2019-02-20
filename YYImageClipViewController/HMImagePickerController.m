//
//  HMImagePickerController.m
//  CaiBao
//
//  Created by 陆正现 on 2018/10/9.
//  Copyright © 2018年 91cb. All rights reserved.
//

#import "HMImagePickerController.h"

@interface HMImagePickerController ()

@end

@implementation HMImagePickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (_Nonnull instancetype)initWithSelectedAssets:(NSArray <PHAsset *> * _Nullable)selectedAssets {
    
    self = [super init];
    
    if (self) {
        
        //    imagePickerVc.selectedAssets = _selectedAssets; // 是否过滤掉已选择的图片
        self.allowTakePicture = NO; // 在内部显示拍照按钮
        self.allowTakeVideo = NO;   // 在内部显示拍视频按
        
        // 导出图片的宽度，默认828像素宽
        //     imagePickerVc.photoWidth = 1000;
        
        // 2. Set the appearance
        // 2. 在这里设置imagePickerVc的外观
         self.navigationBar.barTintColor = APPColor;
        // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
         self.oKButtonTitleColorNormal = [UIColor greenColor];
        // imagePickerVc.navigationBar.translucent = NO;
        self.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
        self.showPhotoCannotSelectLayer = YES;
        self.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
        [self setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
            [doneButton setTitleColor:APPColor forState:UIControlStateNormal];
        }];
        
        // 3. Set allow picking video & photo & originalPhoto or not
        // 3. 设置是否可以选择视频/图片/原图
        self.allowPickingVideo = NO;
        self.allowPickingImage = YES;
        self.allowPickingOriginalPhoto = NO;
        self.allowPickingGif = NO;
        self.allowPickingMultipleVideo = NO; // 是否可以多选视频
        
        // 4. 照片排列按修改时间升序
        self.sortAscendingByModificationDate = YES;
        
        self.statusBarStyle = UIStatusBarStyleLightContent;
        
        // 设置是否显示图片序号
        self.showSelectedIndex = YES;
        
#pragma mark - 到这里为止
        
        // You can get the photos by block, the same as by delegate.
        __weak typeof(self)weakSelf = self;
        // 你可以通过block或者代理，来得到用户选择的照片.
        [self setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            
            if ([weakSelf.hmpickerDelegate respondsToSelector:@selector(imagePickerController:didFinishSelectedImages:selectedAssets:)]) {
                [weakSelf.hmpickerDelegate imagePickerController:weakSelf didFinishSelectedImages:photos selectedAssets:assets];
            }
        }];
        
    }
    
    return self;
}

- (void)setTargetSize:(CGSize)targetSize {
    
    _targetSize = targetSize;
    self.photoWidth = targetSize.width;
}

- (void)setMaxPickerCount:(NSInteger)maxPickerCount {
    _maxPickerCount = maxPickerCount;
    self.maxImagesCount = maxPickerCount;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

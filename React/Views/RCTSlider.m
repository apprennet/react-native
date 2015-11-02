/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "RCTSlider.h"

@implementation RCTSlider
{
  float _unclippedValue;
}

- (void)setValue:(float)value
{
  _unclippedValue = value;
  super.value = value;
}

- (void)setMinimumValue:(float)minimumValue
{
  super.minimumValue = minimumValue;
  super.value = _unclippedValue;
}

- (void)setMaximumValue:(float)maximumValue
{
  super.maximumValue = maximumValue;
  super.value = _unclippedValue;
}

-(void)setTrackImage: (NSString *) trackImageSrc
{

  UIImage *sliderTrackImage = [UIImage imageNamed: trackImageSrc];
  NSInteger width = sliderTrackImage.size.width;

  UIImage *sliderLeftTrackImage = [sliderTrackImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, width, 0, 0)];
  UIImage *setMaximumTrackImage = [sliderTrackImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, width)];

  [super setMinimumTrackImage:sliderLeftTrackImage forState:UIControlStateNormal];
  [super setMaximumTrackImage:setMaximumTrackImage forState:UIControlStateNormal];
}
@end

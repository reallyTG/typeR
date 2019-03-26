library(colorSpec)


### Name: standardRGB
### Title: Convert from XYZ to some standard RGB spaces
### Aliases: RGBfromXYZ
### Keywords: RGB

### ** Examples

RGBfromXYZ( officialXYZ('D65'), 'sRGB' )
#      R G B
# [1,] 1 1 1    # not really 1s, but difference < 1.e-7

RGBfromXYZ( c(.3127,0.3290,0.3583)/0.3290, 'sRGB' )
#              R        G       B
# [1,] 0.9998409 1.000023 1.00024    difference > 1.e-5




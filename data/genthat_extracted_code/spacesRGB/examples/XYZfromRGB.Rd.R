library(spacesRGB)


### Name: Linear RGB and XYZ Calculation
### Title: Convert Signal RGB coordinates to XYZ, or Linear RGB
### Aliases: XYZfromRGB LinearRGBfromSignalRGB
### Keywords: RGB

### ** Examples

XYZfromRGB( c(128,200,255, 0,0,0,  255,255,255), max=255 )$XYZ * 100
##              X         Y       Z
##  [1,] 47.59995  53.11406 102.332
##  [2,]  0.00000   0.00000   0.000
##  [3,] 95.04700 100.00000 108.883


XYZfromRGB( c(128,200,255, 0,0,0,  255,255,255), space='Adobe', max=255 )$XYZ   * 100
##              X         Y        Z
##  [1,] 42.36074  50.82687 103.8475
##  [2,]  0.00000   0.00000   0.0000
##  [3,] 95.04700 100.00000 108.8830




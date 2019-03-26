library(colorSpec)


### Name: DisplayRGB
### Title: Compute Display RGB from Linear RGB
### Aliases: DisplayRGBfromLinearRGB
### Keywords: RGB

### ** Examples

DisplayRGBfromLinearRGB( c(0.2, 0.5) )
# [1] 0.4845292 0.7353570     #  this is display sRGB, in [0,1]

DisplayRGBfromLinearRGB( c(-0.1, 0.2, 0.5, 1), 2.2 )
# [1] 0.0000000 0.4811565 0.7297401 1.0000000    #  gamma=2.2

x = seq( 0, 1, len=101)
plot( x, DisplayRGBfromLinearRGB(x), type='l' )




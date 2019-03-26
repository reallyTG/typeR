library(colorpatch)


### Name: DistColorFun
### Title: Creates a color distance function
### Aliases: DistColorFun

### ** Examples

library(colorspace)
library(colorpatch)
fn <- DistColorFun("LUV")
a <- sRGB(1,0,0)
b <- sRGB(0.8,0.1,0)
my.distance <- fn(a,b)




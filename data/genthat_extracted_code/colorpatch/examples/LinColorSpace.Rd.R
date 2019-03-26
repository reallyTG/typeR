library(colorpatch)


### Name: LinColorSpace
### Title: Creates a linear color space between two colors
### Aliases: LinColorSpace

### ** Examples

library(colorspace)
library(colorpatch)
pal <- LinColorSpace(sRGB(0,1,0), sRGB(0,0.1,0), 32)
pal <- append(pal, sRGB(0,0,0))
pal <- append(pal, LinColorSpace(sRGB(0.1,0,0), sRGB(1,0,0), 32))
PlotUniformity(pal)
print(pal)




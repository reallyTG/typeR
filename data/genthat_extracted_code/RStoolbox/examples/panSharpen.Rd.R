library(RStoolbox)


### Name: panSharpen
### Title: Pan Sharpen Imagery / Image Fusion
### Aliases: panSharpen

### ** Examples

library(raster)
library(ggplot2)

## Load example data
data(lsat)
## Fake panchromatic image (30m resolution covering
## the visible range (integral from blue to red))
pan       <- sum(lsat[[1:3]]) 
ggR(pan, stretch = "lin") 

## Fake coarse resolution image (150m spatial resolution)
lowResImg <- aggregate(lsat, 5) 


## Brovey pan sharpening
lowResImg_pan <- panSharpen(lowResImg, pan, r = 3, g = 2, b = 1, method = "brovey")
lowResImg_pan
## Plot 
ggRGB(lowResImg, stretch = "lin") + ggtitle("Original")
ggRGB(lowResImg_pan, stretch="lin") + ggtitle("Pansharpened (Brovey)")
    




library(DRIP)


### Name: stepEdgeLC2K
### Title: Edge detection, denoising and deblurring
### Aliases: stepEdgeLC2K
### Keywords: image processing, step edge detection

### ** Examples

data(sar) # SAR image is bundled with the package and it is a 
          # standard test image in statistics literature.
edge = stepEdgeLC2K(image = sar, bandwidth = 4, thresh = 20)




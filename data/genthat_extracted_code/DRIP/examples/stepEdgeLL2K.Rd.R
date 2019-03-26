library(DRIP)


### Name: stepEdgeLL2K
### Title: Edge detection, denoising and deblurring
### Aliases: stepEdgeLL2K
### Keywords: image processing, step edge detection

### ** Examples

data(sar) # SAR image is bundled with the package and it is a 
          # standard test image in statistics literature.
edge = stepEdgeLL2K(image = sar, bandwidth = 6, thresh = 20)




library(DRIP)


### Name: stepEdgeLCK
### Title: Edge detection, denoising and deblurring
### Aliases: stepEdgeLCK
### Keywords: image processing, step edge detection

### ** Examples

data(sar) # SAR image is bundled with the package and it is a 
          # standard test image in statistics literature.
edge = stepEdgeLCK(image = sar, bandwidth = 4, thresh = 20)




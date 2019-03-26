library(DRIP)


### Name: stepEdgeLLK
### Title: Edge detection, denoising and deblurring
### Aliases: stepEdgeLLK
### Keywords: image processing, step edge detection

### ** Examples

data(sar) # SAR image is bundled with the package and it is a 
          # standard test image in statistics literature.
edge = stepEdgeLLK(image = sar, bandwidth = 9, thresh = 17)




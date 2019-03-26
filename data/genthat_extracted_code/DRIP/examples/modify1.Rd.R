library(DRIP)


### Name: modify1
### Title: Edge detection, post processing
### Aliases: modify1
### Keywords: post processing, edge detection

### ** Examples

data(sar) # SAR image is bundled with the package and it is a 
          # standard test image in statistics literature.
edge = stepEdgeLCK(sar, 4, 20)
out = modify1(4, sar, edge)




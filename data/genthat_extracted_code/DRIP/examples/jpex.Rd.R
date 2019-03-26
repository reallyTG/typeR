library(DRIP)


### Name: jpex
### Title: Blind Image Deblurring
### Aliases: jpex

### ** Examples

require(DRIP)
data(stopsign)
out = jpex(image=stopsign, bandwidth=as.integer(2), sigma=0.00623, alpha=0.001)




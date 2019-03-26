library(rdetools)


### Name: denoiselabels
### Title: Denoise labels
### Aliases: denoiselabels
### Keywords: models classif regression

### ** Examples

## example with sinc data
d <- sincdata(100, 0.7) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
# rde, return also denoised labels
r <- rde(K, d$y, est_y = TRUE)
r$yh # denoised labels




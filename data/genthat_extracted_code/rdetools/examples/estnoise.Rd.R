library(rdetools)


### Name: estnoise
### Title: Estimate noise level
### Aliases: estnoise
### Keywords: models classif regression

### ** Examples

## estimate noise of sinc data explicitly
d <- sincdata(100, 0.7) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
r <- rde(K, d$y, est_y = TRUE) # estimate relevant dimension
noise <- estnoise(d$y, r$yh, regression = TRUE) # estimate noise level

## estimate noise of sinc data implicitly (via rde_loocv)
d <- sincdata(100, 0.7) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
r <- rde(K, d$y, est_y = TRUE) # estimate relevant dimension AND estimate noise
r$noise # estimated noise level




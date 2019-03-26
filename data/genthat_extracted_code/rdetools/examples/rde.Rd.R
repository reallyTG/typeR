library(rdetools)


### Name: rde
### Title: Relevant Dimension Estimation (RDE)
### Aliases: rde
### Keywords: models classif regression

### ** Examples

## example with sinc data using tcm algorithm
d <- sincdata(100, 0.1) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
# rde, return also denoised labels and noise, fit tcm
r <- rde(K, d$y, est_y = TRUE, est_noise = TRUE)
r$rd # estimated relevant dimension
r$noise # estimated noise
drawkpc(r) # draw kernel pca coefficients

## example with sinc data using loo-cv algorithm
d <- sincdata(100, 0.1) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
# rde, return also denoised labels and noise
r <- rde(K, d$y, est_y = TRUE, est_noise = TRUE, tcm = FALSE)
r$rd # estimated relevant dimension
r$noise # estimated noise
drawkpc(r) # draw kernel pca coefficients




library(rdetools)


### Name: rde_tcm
### Title: Relevant Dimension Estimation (RDE) by Fitting a Two-Component
###   Model (TCM)
### Aliases: rde_tcm
### Keywords: models classif regression

### ** Examples

## example with sinc data
d <- sincdata(100, 0.1) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
# rde, return also denoised labels and noise
r <- rde_tcm(K, d$y, est_y = TRUE, est_noise = TRUE)
r$rd # estimated relevant dimension
r$noise # estimated noise
drawkpc(r) # draw kernel pca coefficients




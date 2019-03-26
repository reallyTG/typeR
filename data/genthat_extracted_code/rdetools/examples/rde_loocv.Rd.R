library(rdetools)


### Name: rde_loocv
### Title: Relevant Dimension Estimation (RDE) by Leave-One-Out
###   Cross-Validation (LOO-CV)
### Aliases: rde_loocv
### Keywords: models classif regression

### ** Examples

## example with sinc data
d <- sincdata(100, 0.1) # generate sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
# rde, return also denoised labels and noise
r <- rde_loocv(K, d$y, est_y = TRUE, est_noise = TRUE)
r$rd # estimated relevant dimension
r$noise # estimated noise
drawkpc(r) # draw kernel pca coefficients




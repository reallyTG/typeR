library(rdetools)


### Name: rdetools-package
### Title: Relevant Dimension Estimation (RDE) in Feature Spaces
### Aliases: rdetools-package rdetools
### Keywords: package classif regression models

### ** Examples

## rde on a noisy sinc data set
d <- sincdata(100, 0.1) # generate noisy sinc data
K <- rbfkernel(d$X) # calculate rbf kernel matrix
# estimate relevant dimension, denoised ys and noise level in data set
r <- rde(K, d$y, est_y = TRUE, est_noise = TRUE)
r$rd # relevant dimension
r$yh # denoised ys
r$noise # noise level in data set
drawkpc(r) # draw kernel pca coefficients

## rde for model selection
d <- sincdata(100, 0.1) # generate sinc data
# do model selection
m <- selectmodel(d$X, d$y, sigma = logspace(-3, 3, 100))
m$best # best model
m$rd # relevant dimension for best model
modelimage(m) # graphical illustration of model selection

## kernel projection regression
d <- sincdata(100, 0.1) # generate sinc data
# do model selection
m <- selectmodel(d$X, d$y, sigma = logspace(-3, 3, 100))
f <- kpr(m) # kernel projection regression
plot(f, -4, 4) # draw predicted function




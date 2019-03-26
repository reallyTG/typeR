library(lineqGPR)


### Name: k2gaussian
### Title: 2D Gaussian Kernel Matrix for '"lineqGP"' Models.
### Aliases: k2gaussian

### ** Examples

xgrid <- seq(0, 1, 0.1)
x <- as.matrix(expand.grid(xgrid, xgrid))
K <- k2gaussian(x, x, par =  c(1, 0.1))
image(K, main = "covariance matrix using a 2D Gaussian kernel")





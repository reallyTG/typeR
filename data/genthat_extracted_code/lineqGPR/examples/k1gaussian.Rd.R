library(lineqGPR)


### Name: k1gaussian
### Title: 1D Gaussian Kernel Matrix for '"lineqGP"' Models.
### Aliases: k1gaussian

### ** Examples

x <- seq(0, 1, 0.01)
K <- k1gaussian(x, x, par =  c(1, 0.1))
image(K, main = "covariance matrix using a Squared Exponential kernel")





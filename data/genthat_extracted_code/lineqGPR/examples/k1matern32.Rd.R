library(lineqGPR)


### Name: k1matern32
### Title: 1D Matern 3/2 Kernel Matrix for '"lineqGP"' Models.
### Aliases: k1matern32

### ** Examples

x <- seq(0, 1, 0.01)
K <- k1matern32(x, x, par =  c(1, 0.1))
image(K, main = "covariance matrix using a Matern 3/2 kernel")





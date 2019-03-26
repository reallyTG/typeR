library(lineqGPR)


### Name: k1matern52
### Title: 1D Matern 5/2 Kernel Matrix for '"lineqGP"' Models.
### Aliases: k1matern52

### ** Examples

x <- seq(0, 1, 0.01)
K <- k1matern52(x, x, par =  c(1, 0.1))
image(K, main = "covariance matrix using a Matern 5/2 kernel")





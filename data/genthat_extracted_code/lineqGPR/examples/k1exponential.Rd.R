library(lineqGPR)


### Name: k1exponential
### Title: 1D Exponential Kernel Matrix for '"lineqGP"' Models.
### Aliases: k1exponential

### ** Examples

x <- seq(0, 1, 0.01)
K <- k1exponential(x, x, par =  c(1, 0.1))
image(K, main = "covariance matrix using a Exponential kernel")





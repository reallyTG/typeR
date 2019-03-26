library(lineqGPR)


### Name: kernCompute
### Title: Kernel Matrix for '"lineqGP"' Models.
### Aliases: kernCompute

### ** Examples

x <- seq(0, 1, 0.01)
K <- kernCompute(x, type = "gaussian", par =  c(1, 0.1))
image(K, main = "covariance matrix")





library(GauPro)


### Name: kernel_sum
### Title: Gaussian Kernel R6 class
### Aliases: kernel_sum
### Keywords: Gaussian data, kriging, process, regression

### ** Examples

k1 <- Exponential$new(beta=1)
k2 <- Matern32$new(beta=2)
k <- k1 + k2
k$k(matrix(c(2,1), ncol=1))




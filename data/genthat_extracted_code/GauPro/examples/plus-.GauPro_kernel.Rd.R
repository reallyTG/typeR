library(GauPro)


### Name: +.GauPro_kernel
### Title: Kernel sum
### Aliases: +.GauPro_kernel

### ** Examples

k1 <- Exponential$new(beta=1)
k2 <- Matern32$new(beta=0)
k <- k1 + k2
k$k(matrix(c(2,1), ncol=1))




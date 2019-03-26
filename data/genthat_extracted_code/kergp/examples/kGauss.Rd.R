library(kergp)


### Name: kGauss
### Title: Gauss (Squared-Exponential) Kernel
### Aliases: kGauss kSE

### ** Examples

kGauss()  # default: d = 1, nu = 5/2
myGauss <- kGauss(d = 2)
coef(myGauss) <- c(range = c(2, 5), sigma2 = 0.1)
myGauss




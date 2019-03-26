library(kergp)


### Name: k1Matern3_2
### Title: One-Dimensional Classical Covariance Kernel Functions
### Aliases: k1FunExp k1FunPowExp k1FunGauss k1FunMatern3_2 k1FunMatern5_2
###   k1Fun1Exp k1Fun1PowExp k1Fun1Gauss k1Fun1Matern3_2 k1Fun1Matern5_2

### ** Examples

## show the functions
n <- 300
x0 <- 0
x <- seq(from = 0, to = 3, length.out = n)
kExpVal <- k1FunExp(x0, x, par = c(range = 1, var = 2))
kGaussVal <- k1FunGauss(x0, x, par = c(range = 1, var = 2))
kPowExpVal <- k1FunPowExp(x0, x, par = c(range = 1, shape = 1.5, var = 2))
kMatern3_2Val <- k1FunMatern3_2(x0, x, par = c(range = 1, var = 2))
kMatern5_2Val <- k1FunMatern5_2(x0, x, par = c(range = 1, var = 2))
kerns <- cbind(as.vector(kExpVal), as.vector(kGaussVal), as.vector(kPowExpVal),
               as.vector(kMatern3_2Val), as.vector(kMatern5_2Val))
matplot(x, kerns, type = "l", main = "five 'kergp' 1d-kernels", lwd = 2)

## extract gradient
head(attr(kPowExpVal, "gradient"))




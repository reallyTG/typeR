library(locpol)


### Name: locpolSmoothers
### Title: Local Polynomial estimation.
### Aliases: locCteSmootherC locLinSmootherC locCuadSmootherC
###   locPolSmootherC looLocPolSmootherC
### Keywords: nonparametric smooth

### ** Examples

N <- 100
xeval <- 0:10/10
d <- data.frame(x = runif(N))
bw <- 0.125
fx <- xeval^2 - xeval + 1
##	Non random
d$y <- d$x^2 - d$x + 1
cuest <- locCuadSmootherC(d$x, d$y ,xeval, bw, EpaK)
lpest2 <- locPolSmootherC(d$x, d$y , xeval, bw, 2, EpaK)
print(cbind(x = xeval, fx, cuad0 = cuest$beta0, 
lp0 = lpest2$beta0, cuad1 = cuest$beta1, lp1 = lpest2$beta1))
##	Random
d$y <- d$x^2 - d$x + 1 + rnorm(d$x, sd = 0.1)
cuest <- locCuadSmootherC(d$x,d$y , xeval, bw, EpaK)
lpest2 <- locPolSmootherC(d$x,d$y , xeval, bw, 2, EpaK)
lpest3 <- locPolSmootherC(d$x,d$y , xeval, bw, 3, EpaK)
cbind(x = xeval, fx, cuad0 = cuest$beta0, lp20 = lpest2$beta0, 
lp30 = lpest3$beta0, cuad1 = cuest$beta1, lp21 = lpest2$beta1, 
lp31 = lpest3$beta1)




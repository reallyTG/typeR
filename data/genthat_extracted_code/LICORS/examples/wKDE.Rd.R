library(LICORS)


### Name: wKDE
### Title: Weighted kernel density estimator (wKDE)
### Aliases: mv_wKDE wKDE
### Keywords: distribution smooth

### ** Examples

### Univariate example ###
xx <- sort(c(rnorm(100, mean = 1), runif(100)))
plot(xx, wKDE(xx), type = "l")
yy <- sort(runif(50, -1, 4) - 1)
lines(yy, wKDE(xx, yy), col = 2)
### Multivariate example ###
XX <- matrix(rnorm(100), ncol = 2)
YY <- matrix(runif(40), ncol = 2)
dens.object <- mv_wKDE(XX)

plot(dens.object)
points(mv_wKDE(XX, YY), col = 2, ylab = "")




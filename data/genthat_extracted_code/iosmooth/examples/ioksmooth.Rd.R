library(iosmooth)


### Name: ioksmooth
### Title: Nadaraya-Watson regression estimator with infinite order
###   kernels.
### Aliases: ioksmooth
### Keywords: Nonparametric Regression Kernel

### ** Examples

set.seed(123)
x <- sort(runif(200, 0, 2*pi))
# Regression function
r <- exp(-x^2) + sin(x) 
# Observed response
y <- r + 0.3*rnorm(200)
bwplot(x, y, smax=10)
# Choose bandwidth about 1/2
plot(x, y)
lines(ioksmooth(x, y, bw=1/2, kernel="Trap"))
# Add the truth in red
lines(x, r, col="red")




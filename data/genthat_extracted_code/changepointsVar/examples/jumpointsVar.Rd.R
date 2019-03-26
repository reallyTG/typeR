library(changepointsVar)


### Name: jumpointsVar
### Title: Change-point detection for variance piecewise constant models
### Aliases: jumpointsVar
### Keywords: changepoints

### ** Examples

set.seed(2)
n = 500
x = 1:n/n
mu = 10+6*sin(3*pi*x)
# if there are two change-points
sigma = c(rep(0.5,.2*n), rep(8,.4*n), rep(3,.4*n))
y = mu + rnorm(n, 0, sigma)
reg = lm(y ~ mu)
h = influence(reg)$hat
r2 = resid(reg)^2/(1-h) + 1
o = jumpointsVar(y=r2, y.res=TRUE, k=30)
o
plot(o)

# if there are no change-points
sigma = 0.5*x
y = mu + rnorm(n, 0, sigma)
reg = lm(y ~ mu)
h = influence(reg)$hat
r2 = resid(reg)^2/(1-h)+1
o = jumpointsVar(y=r2, y.res=TRUE, k=30)
plot(o)

# if the mean behavior of the observed signal is unkown
sigma = c(rep(0.5,.2*n), rep(8,.4*n), rep(3,.4*n))
y = 10 + rnorm(n, 0, sigma)
o = jumpointsVar(y=y, y.res=FALSE, k=30)
plot(o)





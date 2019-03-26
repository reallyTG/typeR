library(ihs)


### Name: ihsmle
### Title: Maximum Likelihood Estimation with the Inverse Hyperbolic Sine
###   Distribution
### Aliases: ihs.mle IHS.MLE print.MLE print.mult.MLE
### Keywords: optimize

### ** Examples

### Showing how to fit a simple vector of data to the inverse 
### hyperbolic sine distribution. 
require(graphics)
require(stats)
set.seed(123456)
x = rnorm(100)
X.f = X ~ x
start = list(mu = 0, sigma = 2, lambda = 0, k = 1)
result = ihs.mle(X.f = X.f, start = start)
sumResult = summary(result)
print(result)
coef(result)
print(sumResult)

### Comparing the fit
xvals = seq(-5, 5, by = 0.05)
coefs = coef(result)
mu = coefs[1]
sigma = coefs[2]
lambda = coefs[3]
k = coefs[4]
plot(xvals, dnorm(xvals), type = "l", col = "blue")
lines(xvals, dihs(xvals, mu = mu, sigma = sigma, 
lambda = lambda, k = k), col = "red")




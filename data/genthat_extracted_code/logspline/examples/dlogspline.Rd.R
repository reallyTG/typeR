library(logspline)


### Name: dlogspline
### Title: Logspline Density Estimation
### Aliases: dlogspline plogspline qlogspline rlogspline
### Keywords: distribution smooth

### ** Examples

x <- rnorm(100)
fit <- logspline(x)
qq <- qlogspline((1:99)/100, fit)
plot(qnorm((1:99)/100), qq)                  # qq plot of the fitted density
pp <- plogspline((-250:250)/100, fit)
plot((-250:250)/100, pp, type = "l")
lines((-250:250)/100,pnorm((-250:250)/100))  # asses the fit of the distribution
dd <- dlogspline((-250:250)/100, fit)
plot((-250:250)/100, dd, type = "l")
lines((-250:250)/100, dnorm((-250:250)/100)) # asses the fit of the density
rr <- rlogspline(100, fit)                   # random sample from fit




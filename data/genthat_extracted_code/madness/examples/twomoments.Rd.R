library(madness)


### Name: twomoments
### Title: Estimate the mean and covariance of values.
### Aliases: twomoments

### ** Examples

set.seed(123)
X <- matrix(rnorm(1000*8),ncol=8)
alst <- twomoments(X)
markowitz <- solve(alst$Sigma,alst$mu)
vcov(markowitz)

# now compute the Sharpe ratios:
alst <- twomoments(X,diag.only=TRUE,df=1)
srs <- alst$mu / sqrt(alst$sigmasq)





library(MBESS)


### Name: ci.cv
### Title: Confidence interval for the coefficient of variation
### Aliases: ci.cv
### Keywords: models htest

### ** Examples

set.seed(113)
N <- 15
X <- rnorm(N, 5, 1)
mean.X <- mean(X)
sd.X <- var(X)^.5

ci.cv(mean=mean.X, sd=sd.X, n=N, alpha.lower=.025, alpha.upper=.025,
conf.level=NULL)
ci.cv(data=X, conf.level=.95)
ci.cv(cv=sd.X/mean.X, n=N, conf.level=.95)





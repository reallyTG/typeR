library(eshrink)


### Name: samplePosterior
### Title: Posterior Sample for Bayesian Linear Regression
### Aliases: samplePosterior

### ** Examples

x <- rnorm(40, mean=2, sd=2)
y <- x + rnorm(40, sd=1)
samplePosterior(X=x, y=y, n=10)
samplePosterior(X=cbind(1, x), y=y, n=10, intercept=TRUE)
samplePosterior(X=cbind(1, x), y=y, n=0, mu=c(3, 3), intercept=TRUE)




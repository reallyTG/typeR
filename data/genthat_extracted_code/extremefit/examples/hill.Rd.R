library(extremefit)


### Name: hill
### Title: Hill estimator
### Aliases: hill

### ** Examples

X <- abs(rcauchy(100))
weights <- rep(1, length(X))
wh <- hill(X, w = weights)




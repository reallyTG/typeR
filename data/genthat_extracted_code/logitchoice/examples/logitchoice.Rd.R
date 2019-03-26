library(logitchoice)


### Name: logitchoice
### Title: Fit a logit choice model with l2 regularization on the
###   coefficients.
### Aliases: logitchoice
### Keywords: models choice logit

### ** Examples

groupSizes = sample(6:18, 100, replace=TRUE)
numGroups = length(groupSizes)
n = sum(groupSizes)
p = 20 
X = matrix(rnorm(n*p), nrow=n)
X = scale(X)
Y = rep(0, n)
Y[cumsum(groupSizes)] = 1
grouping = rep(1:numGroups, groupSizes)
fit = logitchoice(X, Y, grouping)
max(abs(fit$yhat - predict(fit, X, grouping)))




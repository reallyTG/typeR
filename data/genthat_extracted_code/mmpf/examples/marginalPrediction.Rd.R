library(mmpf)


### Name: marginalPrediction
### Title: marginalizes prediction functions
### Aliases: marginalPrediction

### ** Examples

X = replicate(3, rnorm(100))
y = X %*% runif(3)
data = data.frame(X, y)
fit = lm(y ~ ., data)

marginalPrediction(data.frame(X), "X2", c(10, 25), fit,
  aggregate.fun = function(x) c("mean" = mean(x), "variance" = var(x)))




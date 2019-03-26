library(klaR)


### Name: cond.index
### Title: Calculation of Condition Indices for Linear Regression
### Aliases: cond.index
### Keywords: multivariate

### ** Examples

data(Boston)
condition_medv <- cond.index(medv ~ ., data = Boston)
condition_medv




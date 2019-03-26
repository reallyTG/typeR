library(grplasso)


### Name: lambdamax
### Title: Function to Find the Maximal Value of the Penalty Parameter
###   Lambda
### Aliases: lambdamax lambdamax.default lambdamax.formula
### Keywords: misc

### ** Examples

data(splice)
lambdamax(y ~ ., data = splice, model = LogReg(), center = TRUE,
          standardize = TRUE)




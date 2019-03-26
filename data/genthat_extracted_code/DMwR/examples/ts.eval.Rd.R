library(DMwR)


### Name: ts.eval
### Title: Calculate Some Standard Evaluation Statistics for Time Series
###   Forecasting Tasks
### Aliases: ts.eval
### Keywords: models

### ** Examples

## A few example uses of the function
tr <- rnorm(1000)
true <- rnorm(50)
preds <- rnorm(50)
ts.eval(true,preds)
ts.eval(true,preds,train.y=tr)
ts.eval(true,preds,stats='theil',train.y=tr)




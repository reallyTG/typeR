library(KFAS)


### Name: fitted.SSModel
### Title: Smoothed Estimates or One-step-ahead Predictions of Fitted
###   Values
### Aliases: fitted.SSModel fitted.KFS fitted.SSModel

### ** Examples

data("sexratio")
model <- SSModel(Male ~ SSMtrend(1,Q = list(NA)),u = sexratio[, "Total"],
  data = sexratio, distribution = "binomial")
model <- fitSSM(model,inits = -15, method = "BFGS")$model
out <- KFS(model)
identical(drop(out$muhat), fitted(out))

fitted(model)




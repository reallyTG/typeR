library(KFAS)


### Name: plot.SSModel
### Title: Diagnostic Plots of State Space Models
### Aliases: plot.SSModel

### ** Examples

modelNile <- SSModel(Nile ~ SSMtrend(1, Q = list(matrix(NA))), H = matrix(NA))
modelNile <- fitSSM(inits = c(log(var(Nile)),log(var(Nile))), model = modelNile,
 method = "BFGS")$model

if (interactive()) {
  plot(modelNile)
}




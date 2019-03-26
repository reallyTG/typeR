library(KFAS)


### Name: rstandard.KFS
### Title: Extract Standardized Residuals from KFS output
### Aliases: rstandard.KFS

### ** Examples

modelNile <- SSModel(Nile ~ SSMtrend(1, Q = list(matrix(NA))), H = matrix(NA))
modelNile <- fitSSM(inits = c(log(var(Nile)),log(var(Nile))), model = modelNile,
  method = "BFGS")$model
# Filtering and state smoothing
out <- KFS(modelNile, smoothing = c("state", "mean", "disturbance"))

plot(cbind(
    recursive = rstandard(out),
    irregular = rstandard(out, "pearson"),
    state = rstandard(out, "state")),
  main = "recursive and auxiliary residuals")




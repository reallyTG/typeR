library(fbroc)


### Name: plot.fbroc.perf
### Title: Plots ROC based performance metric as histogram
### Aliases: plot.fbroc.perf

### ** Examples

y <- rep(c(TRUE, FALSE), each = 500)
x <- rnorm(1000) + y
result.boot <- boot.roc(x, y, n.boot = 1000)
result.perf <- perf(result.boot, "auc")
plot(result.perf)




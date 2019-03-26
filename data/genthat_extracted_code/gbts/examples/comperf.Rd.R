library(gbts)


### Name: comperf
### Title: Compute model performance
### Aliases: comperf

### ** Examples

y = c(0, 1, 0, 1, 1, 1)
yhat = c(0.5, 0.9, 0.2, 0.7, 0.6,  0.4)
comperf(y, yhat, pfmc = "auc")
# 0.875

y = 1:10
yhat = c(1:5 - 0.1, 6:10 + 0.1)
comperf(y, yhat, pfmc = "mse")
# 0.01





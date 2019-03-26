library(regnet)


### Name: regnet
### Title: fit a regression for given lambda with network-based
###   regularization
### Aliases: regnet
### Keywords: models

### ** Examples

## Survival response
data(SurvExample)
X = rgn.surv$X
Y = rgn.surv$Y
clv = c(1:5) # variable 1 to 5 are clinical variables which we choose not to penalize.
penalty = "network"
b = regnet(X, Y, "survival", penalty, rgn.surv$lamb1, rgn.surv$lamb2, clv=clv, robust=TRUE)
index = which(rgn.surv$beta != 0)
pos = which(b != 0)
tp = length(intersect(index, pos))
fp = length(pos) - tp
list(tp=tp, fp=fp)





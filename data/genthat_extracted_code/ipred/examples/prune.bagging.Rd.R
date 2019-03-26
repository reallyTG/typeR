library(ipred)


### Name: prune.classbagg
### Title: Pruning for Bagging
### Aliases: prune.classbagg prune.regbagg prune.survbagg
### Keywords: tree

### ** Examples


data("Glass", package = "mlbench")
library("rpart")

mod <- bagging(Type ~ ., data=Glass, nbagg=10, coob=TRUE)
pmod <- prune(mod)
print(pmod)






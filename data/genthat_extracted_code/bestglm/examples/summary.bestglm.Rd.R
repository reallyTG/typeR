library(bestglm)


### Name: summary.bestglm
### Title: summary of 'bestglm' object
### Aliases: summary.bestglm
### Keywords: models regression

### ** Examples

data(znuclear)
summary(bestglm(znuclear))
#
#find statistical signficance of overall regression
data(Fires)
summary(bestglm(Fires, IC="BICq", t=1))




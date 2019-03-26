library(AID)


### Name: boxcoxlm
### Title: Box-Cox Transformation for Linear Models
### Aliases: boxcoxlm
### Keywords: functions

### ** Examples


library(AID)

trees=as.matrix(trees)
boxcoxlm(x = trees[,1:2], y = trees[,3])





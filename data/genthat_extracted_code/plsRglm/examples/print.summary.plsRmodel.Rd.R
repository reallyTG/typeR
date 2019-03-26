library(plsRglm)


### Name: print.summary.plsRmodel
### Title: Print method for summaries of plsR models
### Aliases: print.summary.plsRmodel
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
modpls <- plsRglm(yCornell,XCornell,3,modele="pls")
class(modpls)
print(summary(modpls))
rm(list=c("XCornell","yCornell","modpls"))




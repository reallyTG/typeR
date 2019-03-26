library(plsRglm)


### Name: summary.plsRmodel
### Title: Summary method for plsR models
### Aliases: summary.plsRmodel
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
modpls <- plsR(yCornell,XCornell,3,modele="pls")
class(modpls)
summary(modpls)
rm(list=c("XCornell","yCornell","modpls"))




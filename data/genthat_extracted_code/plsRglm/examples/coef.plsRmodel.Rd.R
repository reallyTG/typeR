library(plsRglm)


### Name: coef.plsRmodel
### Title: coef method for plsR models
### Aliases: coef.plsRmodel
### Keywords: methods coef

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
modpls <- plsRglm(yCornell,XCornell,3,modele="pls")
class(modpls)
coef(modpls)
coef(modpls,type="scaled")
rm(list=c("XCornell","yCornell","modpls"))




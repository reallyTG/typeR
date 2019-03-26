library(plsRglm)


### Name: coef.plsRglmmodel
### Title: coef method for plsR models
### Aliases: coef.plsRglmmodel
### Keywords: methods coef

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
modpls <- plsRglm(yCornell,XCornell,3,modele="pls-glm-family",family=gaussian())
class(modpls)
coef(modpls)
coef(modpls,type="scaled")
rm(list=c("XCornell","yCornell","modpls"))




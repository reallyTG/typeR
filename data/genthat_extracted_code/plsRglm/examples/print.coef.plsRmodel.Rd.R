library(plsRglm)


### Name: print.coef.plsRmodel
### Title: Print method for plsR models
### Aliases: print.coef.plsRmodel
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
modpls <- plsRglm(yCornell,XCornell,3,modele="pls")
class(modpls)
print(coef(modpls))
rm(list=c("XCornell","yCornell","modpls"))




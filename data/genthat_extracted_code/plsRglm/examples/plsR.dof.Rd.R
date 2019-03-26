library(plsRglm)


### Name: plsR.dof
### Title: Computation of the Degrees of Freedom
### Aliases: plsR.dof
### Keywords: models regression utilities

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
modpls <- plsR(yCornell,XCornell,4)
plsR.dof(modpls) 
plsR.dof(modpls,naive=TRUE) 




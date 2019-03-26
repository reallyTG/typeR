library(plsRglm)


### Name: infcrit.dof
### Title: Information criteria
### Aliases: infcrit.dof
### Keywords: models regression utilities

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
modpls <- plsR(yCornell,XCornell,4)
infcrit.dof(modpls)




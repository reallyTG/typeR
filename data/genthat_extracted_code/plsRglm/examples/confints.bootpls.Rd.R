library(plsRglm)


### Name: confints.bootpls
### Title: Bootstrap confidence intervals
### Aliases: confints.bootpls
### Keywords: regression models

### ** Examples

## No test: 
data(Cornell)

#Lazraq-Cleroux PLS (Y,X) bootstrap
set.seed(250)
modpls <- plsR(Y~.,data=Cornell,3)
Cornell.bootYX <- bootpls(modpls, R=250)
confints.bootpls(Cornell.bootYX,2:8)
confints.bootpls(Cornell.bootYX,2:8,typeBCa=FALSE)
## End(No test)




library(plsRglm)


### Name: boxplots.bootpls
### Title: Boxplot bootstrap distributions
### Aliases: boxplots.bootpls
### Keywords: regression models

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]

# Lazraq-Cleroux PLS ordinary bootstrap
set.seed(250)
modpls <- plsR(yCornell,XCornell,3)
Cornell.bootYX <- bootpls(modpls, R=250)

# Graph similar to the one of Bastien et al. in CSDA 2005
boxplots.bootpls(Cornell.bootYX,indices=2:8)

## No test: 
data(aze_compl)
modplsglm<-plsRglm(y~.,data=aze_compl,3,modele="pls-glm-logistic")
aze_compl.boot3 <- bootplsglm(modplsglm, R=250)
boxplots.bootpls(aze_compl.boot3)
boxplots.bootpls(aze_compl.boot3,las=3,mar=c(5,2,1,1))
boxplots.bootpls(aze_compl.boot3,indices=c(2,4,6),prednames=FALSE)
## End(No test)




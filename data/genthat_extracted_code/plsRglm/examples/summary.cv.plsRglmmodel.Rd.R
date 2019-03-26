library(plsRglm)


### Name: summary.cv.plsRglmmodel
### Title: Summary method for plsRglm models
### Aliases: summary.cv.plsRglmmodel
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=10,NK=1,
modele="pls-glm-family",family=gaussian())
summary(bbb)
rm(list=c("XCornell","yCornell","bbb"))




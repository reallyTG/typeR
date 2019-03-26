library(plsRglm)


### Name: print.cv.plsRglmmodel
### Title: Print method for plsRglm models
### Aliases: print.cv.plsRglmmodel
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=10,NK=1,
modele="pls-glm-family",family=gaussian())
print(bbb)
rm(list=c("XCornell","yCornell","bbb"))




library(plsRglm)


### Name: summary.cv.plsRmodel
### Title: Summary method for plsR models
### Aliases: summary.cv.plsRmodel
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsR(dataY=yCornell,dataX=XCornell,nt=10,K=6)
summary(bbb)
rm(list=c("XCornell","yCornell","bbb"))




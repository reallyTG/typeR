library(plsRglm)


### Name: print.cv.plsRmodel
### Title: Print method for plsR models
### Aliases: print.cv.plsRmodel
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsR(dataY=yCornell,dataX=XCornell,nt=10,K=6)
print(bbb)
rm(list=c("XCornell","yCornell","bbb"))




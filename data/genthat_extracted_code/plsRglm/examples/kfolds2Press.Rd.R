library(plsRglm)


### Name: kfolds2Press
### Title: Computes PRESS for k-fold cross validated partial least squares
###   regression models.
### Aliases: kfolds2Press
### Keywords: models regression

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsR(dataY=yCornell,dataX=data.frame(scale(as.matrix(XCornell))[,]),nt=6,K=12,NK=1)
bbb2 <- cv.plsR(dataY=yCornell,dataX=data.frame(scale(as.matrix(XCornell))[,]),nt=6,K=6,NK=1)
kfolds2Press(bbb)
kfolds2Press(bbb2)
rm(list=c("XCornell","yCornell","bbb","bbb2"))

## No test: 
data(pine)
Xpine<-pine[,1:10]
ypine<-pine[,11]
bbb <- cv.plsR(dataY=ypine,dataX=Xpine,nt=10,NK=1)
bbb2 <- cv.plsR(dataY=ypine,dataX=Xpine,nt=10,NK=2)
kfolds2Press(bbb)
kfolds2Press(bbb2)

XpineNAX21 <- Xpine
XpineNAX21[1,2] <- NA
bbbNA <- cv.plsR(dataY=ypine,dataX=XpineNAX21,nt=10,NK=1)
bbbNA2 <- cv.plsR(dataY=ypine,dataX=XpineNAX21,nt=10,NK=2)
kfolds2Press(bbbNA)
kfolds2Press(bbbNA2)
rm(list=c("Xpine","XpineNAX21","ypine","bbb","bbb2","bbbNA","bbbNA2"))
## End(No test)




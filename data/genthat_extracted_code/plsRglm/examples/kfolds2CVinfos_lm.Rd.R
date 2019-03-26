library(plsRglm)


### Name: kfolds2CVinfos_lm
### Title: Extracts and computes information criteria and fits statistics
###   for k-fold cross validated partial least squares models
### Aliases: kfolds2CVinfos_lm
### Keywords: internal models regression

### ** Examples
## No test: 
data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsR(dataY=yCornell,dataX=XCornell,nt=10,K=6)
summary(bbb)
rm(list=c("XCornell","yCornell","bbb"))


data(pine)
Xpine<-pine[,1:10]
ypine<-pine[,11]
XpineNAX21 <- Xpine
XpineNAX21[1,2] <- NA
bbb <- cv.plsR(dataY=ypine,dataX=Xpine,nt=10,NK=3)
summary(bbb)
bbb2 <- cv.plsR(dataY=ypine,dataX=XpineNAX21,nt=10,NK=3)
summary(bbb2)
rm(list=c("Xpine","XpineNAX21","ypine","bbb","bbb2"))


data(aze_compl)
Xaze_compl<-aze_compl[,2:34]
yaze_compl<-aze_compl$y
bbb <- cv.plsR(yaze_compl,Xaze_compl,nt=10,K=8,NK=3)
summary(bbb)
summary(bbb,MClassed=TRUE)
rm(list=c("Xaze_compl","yaze_compl","bbb"))
## End(No test)




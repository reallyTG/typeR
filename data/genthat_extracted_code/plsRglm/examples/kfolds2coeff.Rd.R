library(plsRglm)


### Name: kfolds2coeff
### Title: Extracts coefficients from k-fold cross validated partial least
###   squares regression models
### Aliases: kfolds2coeff
### Keywords: models regression

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- PLS_lm_kfoldcv(dataY=yCornell,dataX=XCornell,nt=3,K=nrow(XCornell),keepcoeffs=TRUE)
kfolds2coeff(bbb)
boxplot(kfolds2coeff(bbb)[,2])
rm(list=c("XCornell","yCornell","Xpine","ypine","bbb"))

data(pine)
Xpine<-pine[,1:10]
ypine<-pine[,11]
bbb2 <- cv.plsR(dataY=ypine,dataX=Xpine,nt=4,K=nrow(Xpine),keepcoeffs=TRUE)
kfolds2coeff(bbb2)
boxplot(kfolds2coeff(bbb2)[,1])
rm(list=c("Xpine","ypine","Xpine","ypine","bbb2"))




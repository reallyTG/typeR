library(superpc)


### Name: superpc.lrtest.curv
### Title: Compute values of likelihood ratio test from supervised
###   principal components fit
### Aliases: superpc.lrtest.curv
### Keywords: regression survival

### ** Examples

set.seed(332)
#generate some data

x<-matrix(rnorm(1000*20),ncol=20)
y<-10+svd(x[1:30,])$v[,1]+ .1*rnorm(20)
ytest<-10+svd(x[1:30,])$v[,1]+ .1*rnorm(20)
censoring.status<- sample(c(rep(1,17),rep(0,3)))
censoring.status.test<- sample(c(rep(1,17),rep(0,3)))

featurenames <- paste("feature",as.character(1:1000),sep="")
data<-list(x=x,y=y, censoring.status=censoring.status, featurenames=featurenames)
data.test<-list(x=x,y=ytest, censoring.status=censoring.status.test, featurenames= featurenames)


a<- superpc.train(data, type="survival")

fit<- superpc.predict(a, data, data.test, threshold=1.0, n.components=1, prediction.type="continuous")


aa<- superpc.lrtest.curv(a, data, data.test)
superpc.plot.lrtest(aa)




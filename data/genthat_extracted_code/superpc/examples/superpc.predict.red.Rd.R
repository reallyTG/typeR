library(superpc)


### Name: superpc.predict.red
### Title: Feature selection for supervised principal components
### Aliases: superpc.predict.red
### Keywords: regression survival

### ** Examples



set.seed(332)
#generate some data

x<-matrix(rnorm(1000*40),ncol=40)
y<-10+svd(x[1:60,])$v[,1]+ .1*rnorm(40)
ytest<-10+svd(x[1:60,])$v[,1]+ .1*rnorm(40)
censoring.status<- sample(c(rep(1,30),rep(0,10)))
censoring.status.test<- sample(c(rep(1,30),rep(0,10)))

featurenames <- paste("feature",as.character(1:1000),sep="")
data<-list(x=x,y=y, censoring.status=censoring.status, featurenames=featurenames)
data.test<-list(x=x,y=ytest, censoring.status=censoring.status.test, featurenames= featurenames)



a<- superpc.train(data, type="survival")

fit<- superpc.predict(a, data, data.test, threshold=1.0, n.components=1, prediction.type="continuous")

fit.red<- superpc.predict.red(a,data, data.test, threshold=.6)
superpc.plotred.lrtest(fit.red)





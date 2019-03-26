library(superpc)


### Name: superpc.rainbowplot
### Title: Make rainbow plot of superpc and compeiting predictors
### Aliases: superpc.rainbowplot
### Keywords: regression survival

### ** Examples

set.seed(332)
x<-matrix(rnorm(1000*40),ncol=40)
y<-10+svd(x[1:60,])$v[,1]+ 5*rnorm(40)
censoring.status<- sample(c(rep(1,30),rep(0,10)))

ytest<- 10+svd(x[1:60,])$v[,1]+ 5*rnorm(40)
censoring.status.test<- sample(c(rep(1,30),rep(0,10)))


competing.predictors.test=list(pred1=rnorm(40), pred2=as.factor(sample(c(1,2),replace
=TRUE,size=40)))

featurenames <- paste("feature",as.character(1:1000),sep="")
data<-list(x=x,y=y, censoring.status=censoring.status, featurenames=featurenames)

data.test=list(x=x,y=ytest, censoring.status=censoring.status.test, featurenames=featurenames)

sample.labels=paste("te",as.character(1:40),sep="")

a<- superpc.train(data, type="survival")
pred=superpc.predict(a,data,data.test,threshold=.25, n.components=1)$v.pred


superpc.rainbowplot(data,pred, sample.labels,competing.predictors=competing.predictors.test)





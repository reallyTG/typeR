library(superpc)


### Name: superpc.decorrelate
### Title: Decorrelate features with respect to competing predictors
### Aliases: superpc.decorrelate
### Keywords: regression survival

### ** Examples

set.seed(332)
#generate some data


x<-matrix(rnorm(1000*20),ncol=20)
y<-10+svd(x[1:30,])$v[,1]+ .1*rnorm(20)
ytest<-10+svd(x[1:30,])$v[,1]+ .1*rnorm(20)
censoring.status<- sample(c(rep(1,17),rep(0,3)))
censoring.status.test<- sample(c(rep(1,17),rep(0,3)))
competing.predictors=list(pred1=rnorm(20), pred2=as.factor(sample(c(1,2),replace=TRUE,size=20)))
featurenames <- paste("feature",as.character(1:1000),sep="")

# decorrelate x
foo<-superpc.decorrelate(x,competing.predictors)

xnew<-t(foo$res)

# now use xnew in superpc

data<-list(x=xnew,y=y, censoring.status=censoring.status, featurenames=featurenames)

a<- superpc.train(data, type="survival")

# etc. Remember to decorrelate test data in the same way, before making predictions.




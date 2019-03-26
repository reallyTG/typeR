library(superpc)


### Name: superpc.train
### Title: Prediction by supervised principal components
### Aliases: superpc.train
### Keywords: regression survival

### ** Examples

#generate some example data
set.seed(332)
x<-matrix(rnorm(1000*40),ncol=40)
y<-10+svd(x[1:60,])$v[,1]+ .1*rnorm(40)
censoring.status<- sample(c(rep(1,30),rep(0,10)))

featurenames <- paste("feature",as.character(1:1000),sep="")
data<-list(x=x,y=y, censoring.status=censoring.status, featurenames=featurenames)


a<- superpc.train(data, type="survival")




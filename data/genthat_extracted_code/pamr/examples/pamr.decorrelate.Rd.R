library(pamr)


### Name: pamr.decorrelate
### Title: A function to decorrelate (adjust) the feature matrix with
###   respect to some additional predictors
### Aliases: pamr.decorrelate

### ** Examples

#generate some data
set.seed(120)

x<-matrix(rnorm(1000*20),ncol=20)
y<-c(rep(1,10),rep(2,10))
adjusting.predictors=list(pred1=rnorm(20), pred2=as.factor(sample(c(1,2),replace
=TRUE,size=20)))
xtest=matrix(rnorm(1000*10),ncol=10)
adjusting.predictors.test=list(pred1=rnorm(10), pred2=as.factor(sample(c(1,2),replace
=TRUE,size=10)))

# decorrelate training x wrt adjusting predictors

x.adj=pamr.decorrelate(x,adjusting.predictors)$x.adj
# train classifier with adjusted x

d=list(x=x.adj,y=y)
a<-pamr.train(d)

# decorrelate training and test x wrt adjusting predictors, then make
#predictions for test set

temp <- pamr.decorrelate(x,adjusting.predictors, xtest=xtest,
                         adjusting.predictors.test=adjusting.predictors.test)

d=list(x=temp$x.adj,y=y)
a<-pamr.train(d)
aa<-pamr.predict(a,temp$xtest.adj, threshold=.5)




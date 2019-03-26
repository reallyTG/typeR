library(quantileDA)


### Name: theta.cl
### Title: A function to perform the quantile classifier for a given
###   quantile probability
### Aliases: theta.cl
### Keywords: multivariate

### ** Examples

data(ais)
x=ais[,3:13]
cl=as.double(ais[,1])
set.seed(22)
index=sample(1:202,152,replace=FALSE)
train=x[index,]
test=x[-index,]
cl.train=cl[index]
cl.test=cl[-index]
out.m=theta.cl(train,test,cl.train,0.5,cl.test)
out.m$me.test
misc(out.m$cl.test,cl.test)




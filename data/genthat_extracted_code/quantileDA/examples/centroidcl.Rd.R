library(quantileDA)


### Name: centroidcl
### Title: A function that performs the centroid classifier
### Aliases: centroidcl
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
out.c=centroidcl(train,test,cl.train,cl.test)
out.c$me.test
misc(out.c$cl.test,cl.test)




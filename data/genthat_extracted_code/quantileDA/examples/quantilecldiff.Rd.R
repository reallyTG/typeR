library(quantileDA)


### Name: quantilecldiff
### Title: A function to apply the quantile classifier that uses a
###   different optimal quantile probability for each variable
### Aliases: quantilecldiff
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
out.q=quantilecldiff(train,test,cl.train,cl.test=cl.test)
out.q$me.test
out.q$theta.choice




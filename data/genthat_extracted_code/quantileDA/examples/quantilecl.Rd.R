library(quantileDA)


### Name: quantilecl
### Title: A function that applies the quantile classifier for a given set
###   of quantile probabilities and selects the best quantile classifier in
###   the training set.
### Aliases: quantilecl
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
out.q=quantilecl(train,test,cl.train,cl.test=cl.test)
out.q$me.test
print(out.q)
plot(out.q)




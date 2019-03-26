library(quantileDA)


### Name: quantileCV
### Title: A function to cross-validate the quantile classifier
### Aliases: quantileCV
### Keywords: multivariate

### ** Examples

data(ais)
x=ais[,3:13]
cl=as.double(ais[,1])
out=quantileCV(x,cl,nfold=2)




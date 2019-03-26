library(KODAMA)


### Name: pls.kodama
### Title: Partial Least Squares regression.
### Aliases: pls.kodama

### ** Examples

data(iris)
data=iris[,-5]
labels=iris[,5]
ss=sample(150,15)
ncomponent=3

z=pls.kodama(data[-ss,], labels[-ss], data[ss,], ncomp=ncomponent) 
table(z$Ypred[,ncomponent],labels[ss])




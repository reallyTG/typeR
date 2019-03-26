library(ppls)


### Name: new.penalized.pls
### Title: Prediction for Penalized Partial Least Squares
### Aliases: new.penalized.pls
### Keywords: multivariate

### ** Examples

# see also the example for penalised.pls 
X<-matrix(rnorm(50*200),ncol=50)
y<-rnorm(200)
Xtrain<-X[1:100,]
Xtest<-X[101:200,]
ytrain<-y[1:100]
ytest<-X[101:200]
pen.pls<-penalized.pls(Xtrain,ytrain,ncomp=10)
test.error<-new.penalized.pls(pen.pls,Xtest,ytest)$mse




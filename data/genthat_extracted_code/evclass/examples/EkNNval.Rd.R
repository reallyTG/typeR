library(evclass)


### Name: EkNNval
### Title: Classification of a test set by the EkNN classifier
### Aliases: EkNNval

### ** Examples

## Iris dataset
data(iris)
train<-sample(150,100)
xtrain<-iris[train,1:4]
ytrain<-iris[train,5]
xtst<-iris[-train,1:4]
ytst<-iris[-train,5]
K<-5
fit<-EkNNfit(xtrain,ytrain,K)
test<-EkNNval(xtrain,ytrain,xtst,K,ytst,fit$param)




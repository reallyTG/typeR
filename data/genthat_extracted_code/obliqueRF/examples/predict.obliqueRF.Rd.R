library(obliqueRF)


### Name: predict.obliqueRF
### Title: predict method for oblique random forest objects
### Aliases: predict.obliqueRF
### Keywords: classif regression

### ** Examples

## Classification:
require(obliqueRF);
data(iris);
#sample some cases
s<-sample(150,100);
#extract feature matrix
x_train<-as.matrix(iris[s,1:4]);
#convert to 0/1 class labels
y_train<-(as.numeric(iris[s,5])>1)*1;
iris.orf <- obliqueRF(x_train,y_train);

#extract feature matrix
x<-as.matrix(iris[-s,1:4]);
#convert to 0/1 class labels
y<-(as.numeric(iris[-s,5])>1)*1;
pred <- predict(iris.orf,x,type="response",proximity=TRUE);
sum(pred$pred!=y)




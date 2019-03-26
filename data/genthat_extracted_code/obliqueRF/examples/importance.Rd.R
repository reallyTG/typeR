library(obliqueRF)


### Name: importance
### Title: Extract variable importance measure
### Aliases: importance importance.default importance.obliqueRF
### Keywords: regression classif tree

### ** Examples

require(obliqueRF);
data(iris);
#extract feature matrix
x<-as.matrix(iris[,1:4]);
#convert to 0/1 class labels
y<-(as.numeric(iris[,5])>1)*1;

iris.orf <- obliqueRF(x,y,training_method="log",bImportance=TRUE);
importance(iris.orf);

## Also see example given in ?obliqueRF()





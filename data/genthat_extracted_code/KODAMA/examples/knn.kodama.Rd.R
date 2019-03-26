library(KODAMA)


### Name: knn.kodama
### Title: k-Nearest Neighbors Classifier.
### Aliases: knn.kodama
### Keywords: cross-validation

### ** Examples

 data(iris)
 data=iris[,-5]
 labels=iris[,5]
 ss=sample(150,15)

 z=knn.kodama(data[-ss,], labels[-ss], data[ss,], k=5) 
 table(z$Ypred[,5],labels[ss])




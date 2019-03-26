library(KODAMA)


### Name: knn.double.cv
### Title: Cross-Validation with k-Nearest Neighbors algorithm.
### Aliases: knn.double.cv

### ** Examples

 data(iris)
 data=iris[,-5]
 labels=iris[,5]
 pp=knn.double.cv(data,labels)
 print(pp$Q2Y)
 table(pp$Ypred,labels)
 
#
# data(MetRef)
# u=MetRef$data;
# u=u[,-which(colSums(u)==0)]
# u=normalization(u)$newXtrain
# u=scaling(u)$newXtrain
# pp=knn.double.cv(u,as.factor(MetRef$donor))
# print(pp$Q2Y)
# table(pp$Ypred,MetRef$donor)
#




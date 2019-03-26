library(KODAMA)


### Name: pls.double.cv
### Title: Cross-Validation with PLS-DA.
### Aliases: pls.double.cv

### ** Examples

data(iris)
data=iris[,-5]
labels=iris[,5]
pp=pls.double.cv(data,labels)
print(pp$Q2Y)
table(pp$Ypred,labels)

#
# data(MetRef)
# u=MetRef$data;
# u=u[,-which(colSums(u)==0)]
# u=normalization(u)$newXtrain
# u=scaling(u)$newXtrain
# pp=pls.double.cv(u,as.factor(MetRef$donor))
# print(pp$Q2Y)
# table(pp$Ypred,MetRef$donor)
#




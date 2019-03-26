library(rFerns)


### Name: merge.rFerns
### Title: Merge two random ferns models
### Aliases: merge.rFerns

### ** Examples

set.seed(77)
#Fetch Iris data
data(iris)
#Build models
rFerns(Species~.,data=iris)->modelA
rFerns(Species~.,data=iris)->modelB
modelAB<-merge(modelA,modelB)
print(modelA)
print(modelAB)




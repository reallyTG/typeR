library(manymodelr)


### Name: modeleR
### Title: Perform several kinds of models in one function
### Aliases: modeleR

### ** Examples

iris1<-iris[1:60,]
iris2<-iris[60:nrow(iris),]
modeleR(iris1,Sepal.Length,Petal.Length,
         lm,na.rm=TRUE,iris2)




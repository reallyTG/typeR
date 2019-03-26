library(randomForest)


### Name: rfImpute
### Title: Missing Value Imputations by randomForest
### Aliases: rfImpute rfImpute.formula rfImpute.default
### Keywords: regression classif tree

### ** Examples

data(iris)
iris.na <- iris
set.seed(111)
## artificially drop some data values.
for (i in 1:4) iris.na[sample(150, sample(20)), i] <- NA
set.seed(222)
iris.imputed <- rfImpute(Species ~ ., iris.na)
set.seed(333)
iris.rf <- randomForest(Species ~ ., iris.imputed)
print(iris.rf)




library(RRF)


### Name: rrfImpute
### Title: Missing Value Imputations by RRF
### Aliases: rrfImpute rrfImpute.formula rrfImpute.default
### Keywords: regression classif tree

### ** Examples

data(iris)
iris.na <- iris
set.seed(111)
## artificially drop some data values.
for (i in 1:4) iris.na[sample(150, sample(20)), i] <- NA
set.seed(222)
iris.imputed <- rrfImpute(Species ~ ., iris.na)
set.seed(333)
iris.rf <- RRF(Species ~ ., iris.imputed)
print(iris.rf)




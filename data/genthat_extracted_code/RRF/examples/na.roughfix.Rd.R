library(RRF)


### Name: na.roughfix
### Title: Rough Imputation of Missing Values
### Aliases: na.roughfix na.roughfix.default na.roughfix.data.frame
### Keywords: NA

### ** Examples

data(iris)
iris.na <- iris
set.seed(111)
## artificially drop some data values.
for (i in 1:4) iris.na[sample(150, sample(20)), i] <- NA
iris.roughfix <- na.roughfix(iris.na)
iris.narf <- RRF(Species ~ ., iris.na, na.action=na.roughfix)
print(iris.narf)




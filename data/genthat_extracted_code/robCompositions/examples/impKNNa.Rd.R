library(robCompositions)


### Name: impKNNa
### Title: Imputation of missing values in compositional data using knn
###   methods
### Aliases: impKNNa
### Keywords: manip multivariate

### ** Examples


data(expenditures)
x <- expenditures
x[1,3]
x[1,3] <- NA
xi <- impKNNa(x)$xImp
xi[1,3]





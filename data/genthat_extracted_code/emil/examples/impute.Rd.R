library(emil)


### Name: impute
### Title: Regular imputation
### Aliases: impute impute_knn impute_median

### ** Examples

x <- matrix(rnorm(36), 6, 6)
x[sample(length(x), 5)] <- NA
impute_knn(x)
impute_median(x)




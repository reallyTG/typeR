library(SVMMaj)


### Name: normalize
### Title: Normalize/standardize the columns of a matrix
### Aliases: normalize

### ** Examples


## standardize the first 50 objects to zscores
x  <- iris$Sepal.Length
x1 <- normalize(x[1:50], standardize = 'zscore')
## use the same settings to apply to the next 100 observations
x2 <- normalize(x[-(1:50)], standardize = attr(x1, 'standardization'))




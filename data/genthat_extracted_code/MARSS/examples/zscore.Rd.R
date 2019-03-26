library(MARSS)


### Name: zscore
### Title: z-score a vector or matrix
### Aliases: zscore

### ** Examples

 zscore(1:10)
 x <- zscore(matrix(c(rnorm(6),NA),3,10))
 # mean is 0 and variance is 1
 apply(x, 1, mean, na.rm=TRUE)
 apply(x, 1, var, na.rm=TRUE)




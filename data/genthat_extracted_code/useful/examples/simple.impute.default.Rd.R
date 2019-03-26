library(useful)


### Name: simple.impute.default
### Title: simple.impute.default
### Aliases: simple.impute.default

### ** Examples

theDF <- data.frame(A=1:10, B=1:10, C=1:10)
theDF[c(1, 4, 6), c(1)] <- NA
theDF[c(3, 4, 8), c(3)] <- NA

simple.impute.default(theDF$A)
simple.impute.default(theDF$A, mean)
simple.impute.default(theDF$A, constant(4))





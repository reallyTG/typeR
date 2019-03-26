library(useful)


### Name: simple.impute.data.frame
### Title: simple.impute.data.frame
### Aliases: simple.impute.data.frame

### ** Examples

theDF <- data.frame(A=1:10, B=1:10, C=1:10)
theDF[c(1, 4, 6), c(1)] <- NA
theDF[c(3, 4, 8), c(3)] <- NA

simple.impute.data.frame(theDF)
simple.impute.data.frame(theDF, mean)
simple.impute.data.frame(theDF, constant(4))





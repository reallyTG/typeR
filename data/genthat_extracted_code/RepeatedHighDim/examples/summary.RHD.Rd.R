library(RepeatedHighDim)


### Name: summary.RHD
### Title: Summary of RepeatedHighDim function
### Aliases: summary.RHD

### ** Examples

### Global comparison of a set of 100 genes between two experimental groups.
X1 = matrix(rnorm(1000, 0, 1), 10, 100)
X2 = matrix(rnorm(1000, 0.1, 1), 10, 100)
RHD = RepeatedHighDim(X1, X2, paired=FALSE)
summary(RHD)




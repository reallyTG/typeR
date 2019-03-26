library(grpSLOPE)


### Name: predict.grpSLOPE
### Title: Obtain predictions
### Aliases: predict.grpSLOPE

### ** Examples

set.seed(1)
A   <- matrix(rnorm(100^2), 100, 100)
grp <- rep(rep(1:20), each = 5)
b   <- c(rep(1, 20), rep(0, 80))
y   <- A %*% b + rnorm(10) 
result <- grpSLOPE(X = A, y = y, group = grp, fdr = 0.1)
newdata <- matrix(rnorm(800), 8, 100)
# group SLOPE predictions:
predict(result, newdata)
# [1] -5.283385 -6.313938 -3.173068  1.901488  9.796677 -0.144516 -0.611164 -5.167620
# true mean values:
as.vector(newdata %*% b)
# [1] -5.0937160 -6.5814111 -3.5776124  2.7877449 11.0668777  1.0253236 -0.4261076 -4.8622940





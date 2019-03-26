library(bigstatsr)


### Name: FBM-class
### Title: Class FBM
### Aliases: FBM-class FBM_RC FBM as_FBM

### ** Examples

X <- FBM(10, 10)
typeof(X)
X[] <- rnorm(length(X))
X[, 1:6]
X[] <- 1:100
X[, 1]
X[1, ]  # not recommended for large matrices
X[, -1]
X[, c(TRUE, FALSE)]
X[cbind(1:10, 1:10)] <- NA_real_
X[]

X <- FBM(150, 5)
X[] <- iris   ## you can replace with a df (factors -> integers)
X2 <- as_FBM(iris)
identical(X[], X2[])




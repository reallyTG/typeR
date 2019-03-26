library(MatchLinReg)


### Name: mlr.orthogonalize
### Title: Orthogonalization of vectors with repsect to a matrix
### Aliases: mlr.orthogonalize

### ** Examples


K <- 10
N <- 100
Ko <- 5

X <- matrix(runif(N*K), ncol = K)
Z <- matrix(runif(N*Ko), ncol = Ko)

ret <- mlr.orthogonalize(X = X, Z = Z, normalize = FALSE)

orthogonal <- ret
parallel <- attr(ret, "parallel")
Z.rec <- parallel + orthogonal

# check that parallel and orthogonal components add up to Z
cat("check 1:", all.equal(as.numeric(Z.rec), as.numeric(Z)), "\n")
# check that inner product of orthogonal columns and X columns are zero
cat("check 2:", all.equal(t(orthogonal) %*% X, matrix(0, nrow = Ko, ncol = K)), "\n")





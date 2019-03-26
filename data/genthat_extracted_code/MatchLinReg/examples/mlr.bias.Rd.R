library(MatchLinReg)


### Name: mlr.bias
### Title: Treatment effect bias
### Aliases: mlr.bias

### ** Examples


# number of included adjustment covariates
K <- 10
# number of observations in treatment group
Nt <- 100
# number of observations in control group
Nc <- 100
N <- Nt + Nc
# number of omitted covariates
Ko <- 3

# treatment indicator variable
tr <- c(rep(1, Nt), rep(0, Nc))
# matrix of included (adjustment) covariates
Z.i <- matrix(runif(K*N), ncol = K)
# matrix of omitted covariates
Z.o <- matrix(runif(Ko*N), ncol = Ko)
# coefficients of omitted covariates
gamma.o <- runif(Ko)

retobj <- mlr.bias(tr = tr, Z.i = Z.i, Z.o = Z.o, gamma.o = gamma.o)

# 1) using actual coefficients for computing bias
ret <- retobj$gamma.o

# comparing with brute-force approach
X.i <- cbind(tr, 1, Z.i)
ret2 <- (solve(t(X.i) %*% X.i, t(X.i) %*% Z.o %*% gamma.o))[1]

cat("check 1:", all.equal(ret2, ret), "\n")

# comparing with single method
Z.o.proj <- mlr.orthogonalize(X = cbind(1, Z.i), Z = Z.o, normalize = TRUE)
ret3 <- (solve(t(X.i) %*% X.i, t(X.i) %*% Z.o.proj))[1, ]

cat("check 2:", all.equal(ret3, retobj$single$bias.vec), "\n")

ret4 <- (solve(t(X.i) %*% X.i, t(X.i) %*% retobj$subspace$dir))[1, ]

cat("check 3:", all.equal(as.numeric(ret4), as.numeric(retobj$subspace$bias)), "\n")

ret4 <- (solve(t(X.i) %*% X.i, t(X.i) %*% retobj$absolute$dir))[1, ]

cat("check 4:", all.equal(as.numeric(ret4), as.numeric(retobj$absolute$bias)), "\n")





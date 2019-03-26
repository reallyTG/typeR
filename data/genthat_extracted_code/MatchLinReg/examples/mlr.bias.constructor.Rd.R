library(MatchLinReg)


### Name: mlr.bias.constructor
### Title: Generating the treatment effect bias constructor vector
### Aliases: mlr.bias.constructor

### ** Examples


# number of included adjustment covariates
K <- 10
# number of observations in treatment group
Nt <- 100
# number of observations in control group
Nc <- 100
N <- Nt + Nc

# treatment indicator variable
tr <- c(rep(1, Nt), rep(0, Nc))
# matrix of included (adjustment) covariates
Z.i <- matrix(runif(K*N), ncol = K)

ret <- mlr.bias.constructor(tr = tr, Z.i = Z.i)

# comparing with brute-force approach
X.i <- cbind(tr, 1, Z.i)
ret2 <- (solve(t(X.i) %*% X.i, t(X.i)))[1, ]

cat("check 1:", all.equal(ret2, ret), "\n")

# sampling with replacement
idx <- sample(1:N, size = round(0.75*N), replace = TRUE)
ret3 <- mlr.bias.constructor(tr = tr, Z.i = Z.i, idx = idx)
ret4 <- (solve(t(X.i[idx, ]) %*% X.i[idx, ], t(X.i[idx, ])))[1, ]

cat("check 2:", all.equal(ret3, ret4), "\n")





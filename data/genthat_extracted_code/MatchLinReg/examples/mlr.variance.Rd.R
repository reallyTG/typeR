library(MatchLinReg)


### Name: mlr.variance
### Title: Treatment effect variance
### Aliases: mlr.variance

### ** Examples


data(lalonde)

tr <- lalonde$treat
Z.i <- as.matrix(lalonde[, c("age", "educ", "black"
  , "hispan", "married", "nodegree", "re74", "re75")])

ret <- mlr.variance(tr = tr, Z.i = Z.i)

# comparing with brute-force approach
X.i <- cbind(tr, 1, Z.i)
ret2 <- (solve(t(X.i) %*% X.i))[1, 1]

cat("check 1:", all.equal(ret2, ret), "\n")

# matching with/without replacement
idx <- mlr.match(tr = tr, X = Z.i, caliper = 1.0
  , replace = FALSE)
idx.wr <- mlr.match(tr = tr, X = Z.i, caliper = 1.0
  , replace = TRUE)

ret3 <- mlr.variance(tr = tr, Z.i = Z.i, idx = idx)
cat("variance - matching without replacement:"
  , ret3, "\n")

ret4 <- mlr.variance(tr = tr, Z.i = Z.i, idx = idx.wr)
cat("variance - matching with replacement:"
  , ret4, "\n")





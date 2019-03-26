
context("cross validation")

set.seed(1234)
n <- 30
p <- 50
Niter <-  10
group <- rep(1:(p/10), each = 10)
weights <- rep(1, p/10)
X <- matrix(rnorm(n*p), n)
Y <- X%*%rep(1,p) + rnorm(n)
parallel <- (.Platform$OS.type != "windows")

test_that("invalid parameters", {
  expect_error(cv.lasso(X = X, Y = Y, group = group, weights = weights, K=-1,
    type="sgrlasso", num.lbdseq=10, parallel = parallel),
    "positive integer")
  expect_error(cv.lasso(X = X, Y = Y, group = group, weights = weights, K=5,
                        minlbd = 2, maxlbd = 1,
                        type="sgrlasso", num.lbdseq=10, parallel = parallel),
               "too large")
  expect_error(cv.lasso(X = X, Y = Y, group = group, weights = weights, K=5,
                        minlbd = -2, maxlbd = 1, num.lbdseq = 10,
                        type="sgrlasso",  parallel = parallel),
               "non-negative")
  expect_error(cv.lasso(X = X, Y = Y, group = group, weights = weights, K=5,
                        num.lbdseq = -10,
                        type="sgrlasso", parallel = parallel),
               "non-negative")
})

test_that("NA", {
  expect_error(cv.lasso(X = X, Y = Y, group = group, weights = weights, K=3,
                        type="sgrlasso", num.lbdseq=10, parallel = parallel)
               , NA)
  expect_error(cv.lasso(X = X, Y = Y, group = group, weights = weights, K=3,
                        type="grlasso", num.lbdseq=10, parallel = parallel)
               , NA)
  expect_error(cv.lasso(X = X, Y = Y, K=3,
                        type="slasso", num.lbdseq=10, parallel = parallel)
               , NA)
  expect_error(cv.lasso(X = X, Y = Y, K=3,
                        type="lasso", num.lbdseq=10, parallel = parallel)
               , NA)
})



#-------------------
# lassoFit
#-------------------
set.seed(123)
n <- 50
p <- 10
X <- matrix(rnorm(n*p),n)
Y <- X %*% c(1,1,rep(0,p-2)) + rnorm(n)
weights <- c(1,1)
group <- rep(c(1,2), each=5)

test_that("Low dimensional setting", {
  expect_error(lassoFit(X = X,Y = Y, type="lasso", lbd = .5)
               , NA)
  expect_error(lassoFit(X = X,Y = Y, type="lasso", lbd = -.5)
               , "invalid")
  expect_error(lassoFit(X = X,Y = c(0,Y), type="lasso", lbd = .5)
               , "dimension")
  expect_error(lassoFit(X = X,Y = Y, type="grlasso", lbd = .37
                          , weights=weights, group=group)
               , NA)

  expect_error(lassoFit(X = X,Y = Y, type="lasso", lbd=.5, weights=1:(p+1))
               , "length")
  expect_error(lassoFit(X = X,Y = Y, type="grlasso", lbd=.5,
                          weights=1:p, group=rep(c(1,2),each=5))
               , "length")

})

test_that("cv.lasso", {
  expect_error(lassoFit(X = X,Y = Y, type="lasso"),
               , "error")
  expect_error(lassoFit(X = X,Y = Y, type="lasso", lbd = "cv"),
               , "error")
  expect_error(lassoFit(X = X,Y = Y, type="lasso", lbd = "cv.1se")
               , NA)
  expect_error(lassoFit(X = X,Y = Y, type="lasso", lbd = "cv.min")
               , NA)
  expect_error(lassoFit(X = X,Y = Y, type="lasso", lbd = .5)
               , NA)
  expect_error(lassoFit(X = X,Y = Y, group = group, weights= weights,
                          type="grlasso", lbd = "cv.1se")
               , NA)
  expect_error(lassoFit(X = X,Y = Y, group = group, weights= weights,
                          type="grlasso", lbd = "cv.min")
               , NA)
  expect_error(lassoFit(X = X,Y = Y, group = group, weights= weights,
                          type="grlasso", lbd = .5)
               , NA)
  expect_error(lassoFit(X = X,Y = Y, type="slasso", lbd = "cv.1se")
               , NA)
  expect_error(lassoFit(X = X,Y = Y, type="slasso", lbd = "cv.min")
               , NA)
  expect_error(lassoFit(X = X,Y = Y, type="slasso", lbd = .5)
               , NA)
  expect_error(lassoFit(X = X,Y = Y, group = group, weights= weights,
                          type="sgrlasso", lbd = "cv.1se")
               , NA)
  expect_error(lassoFit(X = X,Y = Y, group = group, weights= weights,
                          type="sgrlasso", lbd = "cv.min")
               , NA)
  expect_error(lassoFit(X = X,Y = Y, group = group, weights= weights,
                          type="sgrlasso", lbd = .5)
               , NA)
})


set.seed(123)
n <- 20
p <- 100
X <- matrix(rnorm(n*p),n)
Y <- X %*% c(1,1,rep(0,p-2)) + rnorm(n)

test_that("High dimensional setting", {
  expect_error(lassoFit(X = X,Y = Y, type="lasso",lbd = .5)
               , NA)
  expect_error(lassoFit(X = X,Y = Y, type="lasso",lbd = -.5)
               , "invalid")
  expect_error(lassoFit(X = X,Y = c(0,Y), lbd=.5, type="lasso")
               , "dimension")
  expect_error(lassoFit(X = X,Y = Y, lbd=.5, type="grlasso",weights=c(1,1), group=rep(c(1,2),each=50))
               , NA)

  expect_error(lassoFit(X = X,Y = Y, lbd=.5, type="lasso",weights=1:(p+1))
               , "length")
  expect_error(lassoFit(X = X,Y = Y, lbd=.5, type="grlasso",weights=1:p, group=rep(c(1,2),each=50))
               , "length")

})



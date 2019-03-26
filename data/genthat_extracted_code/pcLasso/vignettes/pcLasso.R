## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("pcLasso")

## ------------------------------------------------------------------------
library(pcLasso)

## ------------------------------------------------------------------------
set.seed(944)
n <- 100
p <- 20
x <- matrix(rnorm(n*p), n, p)
beta <- matrix(c(rep(2, 5), rep(0, 15)), ncol = 1)
y <- x %*% beta + rnorm(n)

## ----results="hide"------------------------------------------------------
fit <- pcLasso(x, y, ratio = 0.8)

## ------------------------------------------------------------------------
# intercept
fit$a0[20]

# coefficients
fit$beta[, 20]

## ------------------------------------------------------------------------
fit$nzero

## ------------------------------------------------------------------------
# get predictions for 20th model
predict(fit, x[1:5, ])[, 20]

## ------------------------------------------------------------------------
groups <- vector("list", 4)
for (k in 1:4) {
    groups[[k]] <- 5 * (k-1) + 1:5
}
groups

## ----results="hide"------------------------------------------------------
fit <- pcLasso(x, y, ratio = 0.8, groups = groups)

## ------------------------------------------------------------------------
groups[[1]] <- 1:7
groups

## ----results="hide"------------------------------------------------------
fit <- pcLasso(x, y, ratio = 0.8, groups = groups)

## ------------------------------------------------------------------------
# intercept at 20th model: same as before
fit$a0[20]

# coefficients at 20th model: look at origbeta instead
fit$origbeta[, 20]

## ------------------------------------------------------------------------
fit$orignzero

## ----results="hide"------------------------------------------------------
cvfit <- cv.pcLasso(x, y, groups = groups, ratio = 0.8)

## ----results="hide"------------------------------------------------------
cvfit <- cv.pcLasso(x, y, groups = groups, ratio = 0.8, nfolds = 5)

## ----results="hide"------------------------------------------------------
foldid <- sample(rep(seq(10), length = n))
cvfit <- cv.pcLasso(x, y, groups = groups, ratio = 0.8, foldid = foldid)

## ----fig.width=5, fig.height=4-------------------------------------------
plot(cvfit)

## ----fig.width=5, fig.height=4-------------------------------------------
plot(cvfit, orignz = FALSE)

## ------------------------------------------------------------------------
cvfit$lambda.min
cvfit$lambda.1se

## ------------------------------------------------------------------------
predict(cvfit, x[1:5, ])   # s = lambda.1se
predict(cvfit, x[1:5, ], s = "lambda.min")


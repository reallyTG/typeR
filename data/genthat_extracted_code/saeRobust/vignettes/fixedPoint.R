## ------------------------------------------------------------------------
library("saeRobust")
library("magrittr")
convCrit <- function(xn1, xn0) abs(xn0 - xn1) < 0.001
fixedPoint(function(x) 1 + 1 / x, rnorm(1), convCrit = convCrit)

## ------------------------------------------------------------------------
sqrtFp <- function(p) {
  force(p)
  function(x) p / x
}
fixedPoint(sqrtFp(2), 2, addMaxIter(convCrit, 10))

## ------------------------------------------------------------------------
fixedPoint(addHistory(sqrtFp(2)), 2, addMaxIter(convCrit, 10))

## ------------------------------------------------------------------------
fixedPoint(addHistory(addAverageDamp(sqrtFp(2))), 2, addMaxIter(convCrit, 10))

## ------------------------------------------------------------------------
sqrtNr <- function(.p) {
  force(.p)
  f <- function(x) x^2 - .p
  f1 <- function(x) 2 * x
  as.list(environment())
}

newtonRaphson(sqrtNr(2), 2, convCrit = convCrit)


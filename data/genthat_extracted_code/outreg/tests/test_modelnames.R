library(outreg)
library(testthat)
library(magrittr)

context('model names')


test_that('duplicate model names', {
  y <- c(0,1,2,3)
  x <- c(3,2,5,6)
  z <- c(5,2,3,1)
  fitlist <- list(model = lm(y ~ x), model = lm(y ~ x + z))
  o <- outreg(fitlist)
  expect_equal(names(o)[-c(1,2)], names(fitlist))
})


test_that('bad model names', {
  y <- c(0,1,2,3)
  x <- c(3,2,5,6)
  z <- c(5,2,3,1)
  fitlist <- list(statname = lm(y ~ 1),
                  model = lm(y ~ x),
                  variable = lm(y ~ x + z))
  o <- outreg(fitlist)
  expect_equal(names(o)[-c(1,2)], names(fitlist))
})


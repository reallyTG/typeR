library(outreg)
library(testthat)
library(magrittr)



context('variable name repetition')

test_that('norepeat option', {
  y <- c(0,1,2,3)
  x <- c(3,2,5,6)
  fit <- lm(y ~ x)
  o1 <- outreg(fit, norepeat = TRUE)
  o2 <- outreg(fit, norepeat = FALSE)
  expect_true(setequal(o1$.variable, o2$.variable))
  expect_equal(sum(o1$.variable == 'x'), 1)
  expect_equal(sum(o2$.variable == 'x'), 2)
})




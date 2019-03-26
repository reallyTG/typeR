library(outreg)
library(testthat)
library(magrittr)



context('const at bottom')

test_that('const bottom or not', {
  y <- c(0,1,2,3)
  x <- c(3,2,5,6)
  fit <- lm(y ~ x)
  o1 <- outreg(fit, constlast = TRUE)
  o2 <- outreg(fit, constlast = FALSE)
  expect_true(setequal(o1$.variable, o2$.variable))
  expect_equal(unique(o1$.variable)[1], 'x')
  expect_equal(unique(o2$.variable)[1], '(Intercept)')
  expect_equal(setdiff(unique(o1$.variable), '')[2], '(Intercept)')
  expect_equal(setdiff(unique(o2$.variable), '')[2], 'x')
})




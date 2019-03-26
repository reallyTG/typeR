library(outreg)
library(testthat)
library(magrittr)



context('validity of fitlist input')

test_that('invalid cases', {
  expect_error(outreg(1))

  expect_error(outreg(list(1, 2, 3)))

  # single fit is okay
  y <- c(0,1,2,3)
  x <- c(3,2,5,6)
  fit <- lm(y ~ x)
  expect_true(is.data.frame(outreg(fit)))

  # each element of fitlist must be supported
  expect_error(outreg(list(fit, 'a', 'b')))
})


test_that('supported objects', {

  # lm
  y <- c(0,1,2,3)
  x <- c(3,2,5,6)
  fit <- lm(y ~ x)
  expect_true(is.data.frame(outreg(fit)))

  # glm
  y <- c(1, 1, 0, 0)
  x <- c(3, 2, 2, 1)
  fit <- glm(y ~ x, family = binomial())
  expect_true(is.data.frame(outreg(fit)))

  # survreg
  library(survival)
  y <- c(1, 4, 5, 2)
  s <- c(0, 0, 1, 1)
  x <- c(2, 3, 1, 3)
  fit <- survreg(Surv(y, s) ~ x)
  expect_true(is.data.frame(outreg(fit)))

  # ivreg
  library(AER)
  y <- c(1, 4, 5, 2)
  x <- c(2, 2, 1, 5)
  z <- c(3, 1, 4, 5)
  fit <- ivreg(y ~ x | z)
  expect_true(is.data.frame(outreg(fit)))

})



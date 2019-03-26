library(outreg)
library(testthat)
library(magrittr)



context('displayed stats')

test_that('include pv and tv, remove se', {
  y <- c(0,1,2,3)
  x <- c(3,2,5,6)
  fit <- lm(y ~ x)
  o <- outreg(fit, pv = TRUE, tv = TRUE, se = FALSE)

  included <- get_display_names(c('pv', 'tv'))
  removed  <- get_display_names(c('se'))
  expect_true(all(included %in% o[['.stat']]))
  expect_true(all(!(removed %in% o[['.stat']])))
})


test_that('two way to specify stats', {
  y <- c(0,1,2,3)
  x <- c(3,2,5,6)
  fit <- lm(y ~ x)
  expect_identical(
    outreg(fit, pv = TRUE, se = FALSE),
    outreg(fit, displayed = list(pv = TRUE, se = FALSE))
  )
})


test_that('suppress model stats', {
  y <- c(0,1,2,3)
  x <- c(3,2,5,6)
  fit <- lm(y ~ x)
  o <- outreg(fit, nobs = FALSE)
  disp_name <- get_display_names('nobs')
  expect_true(!(disp_name %in% o$.stat))
})


test_that('priority in display specification', {
  y <- c(0,1,2,3)
  x <- c(3,2,5,6)
  fit <- lm(y ~ x)
  expect_identical(
    outreg(fit, pv = TRUE),
    outreg(fit, pv = TRUE, displayed = list(pv = FALSE))
  )
})






###
### Prepare environment
################################################################################
library(testthat)


###
### Context (1 for each file)
################################################################################
context("Unit tests for the demoGraphic function")


test_that("get_mean works", {
  x <- c(1:10)
  n <- length(x)
  mean <- mean(x, na.rm = TRUE)
  sd <- sd(x, na.rm = TRUE)
  var <- var(x, na.rm = TRUE)
  n.miss <- sum(is.na(x))
  result <- data.frame(n, mean, sd, var, n.miss)
  expect_equal(get_mean(1:10), result)
})


test_that("cont_smd works", {
  smd <- (10 - 15)/sqrt((3 + 5)/2)
  expect_equal(cont_smd(10,15,3,5), smd)
})


test_that("smd_ci works", {
  n1 <- 100
  n2 <- 250
  smd <- 0.3
  se <- sqrt((n1 + n2)/(n1 * n2) + smd^2/(2 * (n1 + n2)))
  smd.l <- smd - 1.96 * se
  smd.u <- smd + 1.96 * se
  smd.ci <- c(smd.l, smd.u)
  expect_equal(smd_ci(100,250,0.3), smd.ci)
})




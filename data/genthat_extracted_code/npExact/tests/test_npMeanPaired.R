context("Testing npMeanPaired")

ones <- rep(1, 20)
zeros <- rep(0, 20)

res <- npMeanPaired(ones, zeros)
theta.1 <- res$theta
test_that("correct rejection 1",
          expect_true(res$rejection))
test_that("d.alt > null.value",
          expect_true(res$d.alternative > res$null.value))

res <- npMeanPaired(zeros, ones)
test_that("correct rejection 2",
          expect_true(res$rejection))
test_that("d.alt < null.value",
          expect_true(res$d.alternative < res$null.value))

res <- npMeanPaired(zeros, ones, alternative = "greater", alpha = 0.025)
test_that("theta equal in both two.sided and greater",
          expect_equal(theta.1, res$theta))
test_that("d.alt > null.value",
          expect_true(res$d.alternative > res$null.value))

res <- npMeanPaired(ones, zeros, alternative = "greater", alpha = 0.025)
test_that("theta equal in both two.sided and greater",
          expect_equal(theta.1, res$theta))
test_that("d.alt > null.value",
          expect_true(res$d.alternative > res$null.value))

res <- npMeanPaired(zeros, ones, alternative = "less", alpha = 0.025)
test_that("theta equal in both two.sided and greater",
          expect_equal(theta.1, res$theta))
test_that("d.alt < null.value",
          expect_true(res$d.alternative < res$null.value))

res <- npMeanPaired(ones, zeros, alternative = "less", alpha = 0.025)
test_that("theta equal in both two.sided and greater",
          expect_equal(theta.1, res$theta))
test_that("d.alt < null.value",
          expect_true(res$d.alternative < res$null.value))


## set.seed(8909)
## x1 <- runif(30) * 4
## x2 <- runif(30) * 4

## npMeanPaired(x1, x2, lower = -2, upper = 4)
## res <- npMeanPaired(x1, x2, lower = -2, upper = 4,
##              alternative = "less", alpha = 0.025)
## npMeanPaired(x1, x2, lower = -2, upper = 4,
##              alternative = "greater", alpha = 0.025)




set.seed(123)
x1 <- runif(3)
x2 <- runif(3)

res <- npMeanPaired(x1, x2, alternative = "two.sided")
test_that("npMeanPaired, no theta calculation, two.sided",
          expect_true(is.null(res$theta)))

res <- npMeanPaired(x1, x2, alternative = "greater")
test_that("npMeanPaired, no theta calculation, greater",
          expect_true(is.null(res$theta)))

res <- npMeanPaired(x1, x2, alternative = "less")
test_that("npMeanPaired, no theta calculation, less",
          expect_true(is.null(res$theta)))




##
## complain (or not) about NA
##
mostly.ones <- data.frame(ones = c(rep(1, 15), rep(0, 8)))
mostly.zeros <- data.frame(zeros = c(rep(0, 14), rep(1, 9)))
mostly.zeros[["zeros"]][4] <- NA

test_that("warning about NA",
          expect_warning(npMeanPaired(mostly.zeros, mostly.ones)))

res <- npMeanPaired(mostly.ones, mostly.zeros)
test_that("positive d.alt",
          expect_equal(res$d.alternative, 0.569, tolerance = 0.01))
res <- npMeanPaired(mostly.zeros, mostly.ones)
test_that("negative d.alt",
          expect_equal(res$d.alternative, -0.569, tolerance = 0.01))

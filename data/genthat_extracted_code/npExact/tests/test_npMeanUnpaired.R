context("npMeanUnpaired")

ones <- rep(1, 20)
zeros <- rep(0, 20)

res <- npMeanUnpaired(ones, zeros)
theta.1 <- res$theta
test_that("correct rejection 1",
          expect_true(res$rejection))

res <- npMeanUnpaired(zeros, ones)
test_that("correct rejection 2",
          expect_true(res$rejection))

res <- npMeanUnpaired(zeros, ones, alternative = "less", alpha = 0.025)
test_that("theta equal in both two.sided and greater",
          expect_equal(theta.1, res$theta))


set.seed(456)
x1 <- runif(3)
x2 <- runif(3)

res <- npMeanUnpaired(x1, x2, alternative = "two.sided")
test_that("npMeanUnpaired, no theta calculation, two.sided",
          expect_true(is.null(res$theta)))

res <- npMeanUnpaired(x1, x2, alternative = "greater")
test_that("npMeanUnpaired, no theta calculation, greater",
          expect_true(is.null(res$theta)))

res <- npMeanUnpaired(x1, x2, alternative = "less")
test_that("npMeanUnpaired, no theta calculation, less",
          expect_true(is.null(res$theta)))

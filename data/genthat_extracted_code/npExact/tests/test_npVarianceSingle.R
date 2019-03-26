context("npVarianceSingle")

set.seed(123)
x <- runif(20)


res <- npVarianceSingle(x, v = .2)
theta.1 <- res$thetaValue
test_that("correct not-rejection 1",
          expect_false(res$rejection))

## res <- npVarianceSingle(x, v = .2, alternative = "less", alpha = 0.025)
## test_that("theta unequal in two.sided and greater alternative",
##           expect_equal(theta.1[2], res$theta))

res <- npVarianceSingle(x, v = .2, alternative = "greater", alpha = 0.025)
test_that("theta equal in two.sided and greater alternative with alpha / 2",
          expect_equal(theta.1[1], res$theta))


res <- npVarianceSingle(x, v = .25)
theta.1 <- res$theta
test_that("correct rejection 1",
          expect_true(res$rejection))

## weird example:
## "less" rejects at 0.23 but not at 0.24!
## res <- npVarianceSingle(x, v = .23, alternative = "less", alpha = 0.025)
## res <- npVarianceSingle(x, v = .24, alternative = "less", alpha = 0.025)


set.seed(345)
x <- runif(500)

## test greater
res <- npVarianceSingle(x, v = 0.03, alternative = "greater")
test_that("correct greater-rejection",
          expect_true(res$rejection))

res <- npVarianceSingle(x, v = 0.05, alternative = "greater")
test_that("correct greater-rejection",
          expect_true(res$rejection))

res <- npVarianceSingle(x, v = 0.07, alternative = "greater")
test_that("correct greater-rejection",
          expect_false(res$rejection))

res <- npVarianceSingle(x, v = 0.09, alternative = "greater")
test_that("correct greater-rejection",
          expect_false(res$rejection))

res <- npVarianceSingle(x, v = 0.12, alternative = "greater")
test_that("correct greater-rejection",
          expect_false(res$rejection))

## test less
res <- npVarianceSingle(x, v = 0.03, alternative = "less")
test_that("correct less-rejection",
          expect_false(res$rejection))

res <- npVarianceSingle(x, v = 0.05, alternative = "less")
test_that("correct less-rejection",
          expect_false(res$rejection))

res <- npVarianceSingle(x, v = 0.07, alternative = "less")
test_that("correct less-rejection",
          expect_false(res$rejection))

res <- npVarianceSingle(x, v = 0.1, alternative = "less")
test_that("correct less-rejection",
          expect_true(res$rejection))

res <- npVarianceSingle(x, v = 0.12, alternative = "less")
test_that("correct less-rejection",
          expect_true(res$rejection))

##
## theta calculation
##

set.seed(123)
x <- runif(2)

res <- npVarianceSingle(x, v = 0.1, alternative = "greater")
test_that("npVarianceSingle, no theta calculation. greater",
          expect_true(is.null(res$theta)))

res <- npVarianceSingle(x, v = 0.01, alternative = "less")
test_that("npVarianceSingle, no theta calculation. less",
          expect_true(is.null(res$theta)))

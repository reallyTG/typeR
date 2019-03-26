context("Testing npStochinUnpaired")

ones <- rep(1, 20)
zeros <- rep(0, 20)

res <- npStochinUnpaired(ones, zeros)
theta.1 <- res$theta
test_that("correct rejection 1",
          expect_true(res$rejection))

res <- npStochinUnpaired(zeros, ones)
test_that("correct rejection 2",
          expect_true(res$rejection))

res <- npStochinUnpaired(zeros, ones, alternative = "less", alpha = 0.025)
test_that("theta equal in both two.sided and greater (with alpha / 2)",
          expect_equal(theta.1, res$theta))

res <- npStochinUnpaired(zeros, ones, alternative = "less")
test_that("theta unequal in both two.sided and greater",
          expect_true(theta.1 != res$theta))


##
## some more tests
##
set.seed(123)
high <- rnorm(50) + 2
low <- rnorm(50)

## df <- NULL
## for(dtemp in seq(-0.8, .85, by = 0.02)) {
##     res <- npStochinUnpaired(high, low, d = dtemp,
##                              alternative = "greater")
##     df <- rbind(df, c(dtemp, res$theta, res$probrej))
## }
## colnames(df) <- c("d", "theta", "rej")
## df1 <- melt(as.data.frame(df), id.vars = "d")
## qplot(x = d, y = value, geom = "line", colour = variable, data = df1)


##
## high and low
##

## should reject: high > low?
res <- npStochinUnpaired(high, low, d = 0.6,
                          alternative = "greater")
test_that("correct rejection 1",
          expect_true(res$rejection))
test_that("sample estimate 1",
          expect_true(res$stochin.estimate > 0.8))

## should reject: high > low?
res <- npStochinUnpaired(high, low, d = -0.6,
                         alternative = "greater")
test_that("correct rejection 2",
          expect_true(res$rejection))
test_that("sample estimate 2",
          expect_true(res$stochin.estimate > 0.8))

## should NOT reject: high < low?
res <- npStochinUnpaired(high, low, d = 0.6,
                         alternative = "less")
test_that("correct non-rejection 3",
          expect_true(!res$rejection))
test_that("sample estimate 3",
          expect_true(res$stochin.estimate > 0.8))

## should NOT reject: high < low?
res <- npStochinUnpaired(high, low, d = -0.6,
                         alternative = "less")
test_that("correct non-rejection 4",
          expect_true(!res$rejection))
test_that("sample estimate 4",
          expect_true(res$stochin.estimate > 0.8))

##
## low and high
##

## should NOT reject: low > high?
res <- npStochinUnpaired(low, high, d = -0.6,
                         alternative = "greater")
test_that("correct non-rejection 5",
          expect_true(!res$rejection))
test_that("sample estimate 5",
          expect_true(res$stochin.estimate < -0.8))

## should NOT reject: low > high?
res <- npStochinUnpaired(low, high, d = 0.6,
                         alternative = "greater")
test_that("correct non-rejection 6",
          expect_true(!res$rejection))
test_that("sample estimate 6",
          expect_true(res$stochin.estimate < -0.8))

## should reject: low < high?
res <- npStochinUnpaired(low, high, d = -0.6,
                         alternative = "less")
test_that("correct rejection 7",
          expect_true(res$rejection))
test_that("sample estimate 7",
          expect_true(res$stochin.estimate < -0.8))

## should reject: low < high?
res <- npStochinUnpaired(low, high, d = 0.6,
                         alternative = "less")
test_that("correct rejection 8",
          expect_true(res$rejection))
test_that("sample estimate 8",
          expect_true(res$stochin.estimate < -0.8))


##
## two-sided tests
##

##
## high and low
##

## should reject: high > low?
res <- npStochinUnpaired(high, low, d = 0.6,
                          alternative = "two.sided")
test_that("correct rejection 10",
          expect_true(res$rejection))
test_that("sample estimate 10",
          expect_true(res$stochin.estimate > 0.8))

## should reject: high > low?
res <- npStochinUnpaired(high, low, d = -0.6,
                         alternative = "two.sided")
test_that("correct rejection 11",
          expect_true(res$rejection))
test_that("sample estimate 11",
          expect_true(res$stochin.estimate > 0.8))

##
## low and high
##

## should reject: low < high?
res <- npStochinUnpaired(low, high, d = -0.6,
                         alternative = "two.sided")
test_that("correct rejection 12",
          expect_true(res$rejection))
test_that("sample estimate 12",
          expect_true(res$stochin.estimate < -0.8))

## should reject: low < high?
res <- npStochinUnpaired(low, high, d = 0.6,
                         alternative = "two.sided")
test_that("correct rejection 13",
          expect_true(res$rejection))
test_that("sample estimate 13",
          expect_true(res$stochin.estimate < -0.8))


##
## theta calculation error
##

set.seed(453)
x1 <- rnorm(3)
x2 <- rnorm(3)

res <- npStochinUnpaired(x1, x2, alternative = "two.sided")
test_that("npStochinUnpaired, no theta calculation, two.sided",
          expect_true(is.null(res$theta)))

res <- npStochinUnpaired(x1, x2, alternative = "greater")
test_that("npStochinUnpaired, no theta calculation, greater",
          expect_true(is.null(res$theta)))

res <- npStochinUnpaired(x1, x2, alternative = "less")
test_that("npStochinUnpaired, no theta calculation, less",
          expect_true(is.null(res$theta)))

##
## with duplicates in x1 and x2
## x1, x2 as data.frames
## alternative = two.sided: choose d.alt from "less" and "greater"-alternatives
##
mostly.ones <- data.frame(ones = c(rep(1, 15), rep(0, 8)))
mostly.zeros <- data.frame(zeros = c(rep(0, 14), rep(1, 9)))

res <- npStochinUnpaired(mostly.ones, mostly.zeros)
test_that("positive d.alt",
          expect_equal(res$d.alternative, 0.561, tolerance = .001))

res <- npStochinUnpaired(mostly.zeros, mostly.ones)
test_that("positive d.alt",
          expect_equal(res$d.alternative, 0.561, tolerance = .001))

res <- npStochinUnpaired(mostly.ones, mostly.zeros, d = 0.1)
test_that("positive d.alt",
          expect_equal(res$d.alternative, 0.644, tolerance = .001))
res <- npStochinUnpaired(mostly.ones, mostly.zeros, d = -0.1)
test_that("positive d.alt",
          expect_equal(res$d.alternative, 0.473, tolerance = .001))



##
## complain (or not) about NA
##
mostly.zeros[["zeros"]][4] <- NA
test_that("complain about NA",
          expect_error(npStochinUnpaired(mostly.zeros, mostly.ones)))

res <- npStochinUnpaired(mostly.zeros, mostly.ones,
                         ignoreNA = TRUE)
test_that("positive probability of rejection",
          expect_true(res$probrej >= 0))

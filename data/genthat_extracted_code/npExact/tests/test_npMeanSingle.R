context("npMeanSingle")

ones <- rep(1, 20)
zeros <- rep(0, 20)

res <- npMeanSingle(ones, mu = .5)
theta.1 <- res$theta
test_that("correct rejection: ones",
          expect_true(res$rejection))
test_that("D.alt > null value",
          expect_true(res$d.alternative[1] > res$null.value))
test_that("D.alt < null value",
          expect_true(res$d.alternative[2] < res$null.value))

res <- npMeanSingle(zeros, mu = .5)
theta.2 <- res$theta
test_that("correct rejection: zeros",
          expect_true(res$rejection))
test_that("D.alt > null value",
          expect_true(res$d.alternative[1] > res$null.value))
test_that("D.alt < null value",
          expect_true(res$d.alternative[2] < res$null.value))

res <- npMeanSingle(ones, mu = .5, alternative = "greater", alpha = 0.025)
test_that("theta equal in two.sided and greater alternative with alpha / 2",
          expect_equal(theta.1, res$theta))
test_that("D.alt > null value",
          expect_true(res$d.alternative > res$null.value))

res <- npMeanSingle(ones, mu = .5, alternative = "less", alpha = 0.025)
test_that("theta equal in two.sided and greater alternative with alpha / 2",
          expect_equal(theta.1, res$theta))
test_that("D.alt < null value",
          expect_true(res$d.alternative < res$null.value))

res <- npMeanSingle(zeros, mu = .5, alternative = "greater", alpha = 0.025)
test_that("theta equal in two.sided and greater alternative with alpha / 2",
          expect_equal(theta.2, res$theta))
test_that("D.alt > null value",
          expect_true(res$d.alternative > res$null.value))

res <- npMeanSingle(zeros, mu = .5, alternative = "less", alpha = 0.025)
test_that("theta equal in two.sided and greater alternative with alpha / 2",
          expect_equal(theta.2, res$theta))
test_that("D.alt < null value",
          expect_true(res$d.alternative < res$null.value))

res <- npMeanSingle(ones, mu = .5, alternative = "greater")
test_that("theta unequal in two.sided and greater alternative",
          expect_true(theta.1 != res$theta))
test_that("D.alt > null value",
          expect_true(res$d.alternative > res$null.value))

res <- npMeanSingle(ones, mu = .5, alternative = "less")
test_that("theta unequal in two.sided and greater alternative",
          expect_true(theta.1 != res$theta))
test_that("D.alt < null value",
          expect_true(res$d.alternative < res$null.value))

for(i in 1:5) {
    res <- npMeanSingle(rep(0.5, i), mu = .5)
    test_that(paste("Not possible to calculate theta: ", i, sep = ""),
              expect_null(res$theta))
}


##
## extreme case
##
w <- rep(0, 100)
w[1] <- .5

res <- npMeanSingle(w, mu = 0.0001, upper = 5)
test_that("Correct rejection: extreme case",
          expect_true(res$rejection))
test_that("D.alt > null value: extreme case",
          expect_true(res$d.alternative > res$null.value))


res <- npMeanSingle(w, mu = 0.0001, upper = 5,
             alternative = "greater", alpha = 0.025)
test_that("Correct rejection: extreme case",
          expect_true(res$rejection))
test_that("D.alt > null value: extreme case",
          expect_true(res$d.alternative > res$null.value))

res <- npMeanSingle(w, mu = 0.0001, upper = 5,
             alternative = "less", alpha = 0.025)
test_that("Correct non-rejection: extreme case",
          expect_false(res$rejection))
## d.alternative is a zero-length vector
## test_that("D.alt is null",
##           expect_null(res$d.alternative))

res <- npMeanSingle(w, mu = .1, upper = 5,
             alternative = "less", alpha = 0.025)
test_that("Correct rejection: extreme case",
          expect_false(res$rejection))
## d.alt same as above
## test_that("D.alt is null",
##           expect_null(res$d.alternative))

res <- npMeanSingle(w, mu = .5, upper = 5,
             alternative = "less", alpha = 0.025)
test_that("Correct rejection: extreme case",
          expect_true(res$rejection))
test_that("D.alt < null value",
          expect_true(res$d.alternative < res$null.value))

res <- npMeanSingle(w, mu = 1, upper = 5,
             alternative = "less", alpha = 0.025)
test_that("Correct rejection: extreme case",
          expect_true(res$rejection))
test_that("D.alt < null value",
          expect_true(res$d.alternative < res$null.value))


##
## development of probability of rejection

set.seed(567)
w <- runif(40)

resGreater <- npMeanSingle(w, mu = 0.01, upper = 5,
                           alternative = "greater", alpha = 0.025)
probrejGreater.before <- resGreater$probrej
resLess <- npMeanSingle(w, mu = 0.01, upper = 5,
                        alternative = "less", alpha = 0.025)
probrejLess.before <- resLess$probrej

for(mu in seq(0.1, 1, by = 0.1)) {

    ## print(mu)

    resGreater <- npMeanSingle(w, mu = mu, upper = 5,
                               alternative = "greater", alpha = 0.025)
    resLess <- npMeanSingle(w, mu = mu, upper = 5,
                            alternative = "less", alpha = 0.025)

    test_that("Greater: probrej.before >= probrej.after",
              expect_true(probrejGreater.before >= resGreater$probrej))

    test_that("Less: probrej.before <= probrej.after",
              expect_true(probrejLess.before <= resLess$probrej))

    probrejLess.before <- resLess$probrej
    probrejGreater.before <- resGreater$probrej

}

set.seed(123)
x <- runif(600)

res <- npMeanSingle(x, mu = .8, lower = -2, upper = 2,
                    alternative = "greater", alpha = 0.025)
test_that("Correct non-rejection: large example, extra bounds",
          expect_false(res$rejection))
test_that("D.alt > null value: large example",
          expect_true(res$d.alternative > res$null.value))

res <- npMeanSingle(x, mu = .8, lower = -2, upper = 2,
                    alternative = "less", alpha = 0.025)
test_that("Correct rejection: large example, extra bounds",
          expect_true(res$rejection))
test_that("D.alt < null value: extreme case",
          expect_true(res$d.alternative < res$null.value))


##
## another example
##
x <- runif(45, max = 10)

## greater
res <- npMeanSingle(x, mu = .8, lower = -1, upper = 12,
                    alternative = "greater", alpha = 0.025)
test_that("Correct rejection: extra bounds",
          expect_true(res$rejection))
test_that("D.alt > null value: large example",
          expect_true(res$d.alternative > res$null.value))

res <- npMeanSingle(x, mu = 8, lower = -1, upper = 12,
                    alternative = "greater", alpha = 0.025)
test_that("Correct non-rejection: extra bounds",
          expect_false(res$rejection))
test_that("D.alt > null value: large example",
          expect_true(res$d.alternative > res$null.value))

## less
res <- npMeanSingle(x, mu = .8, lower = -1, upper = 12,
                    alternative = "less", alpha = 0.025)
test_that("Correct non-rejection: extra bounds",
          expect_false(res$rejection))
test_that("D.alt < null value: large example",
          expect_true(res$d.alternative < res$null.value))

res <- npMeanSingle(x, mu = 8, lower = -1, upper = 12,
                    alternative = "less", alpha = 0.025)
test_that("Correct rejection: extra bounds",
          expect_true(res$rejection))
test_that("D.alt < null value: large example",
          expect_true(res$d.alternative < res$null.value))


set.seed(123)
x <- runif(2)
res <- npMeanSingle(x, mu = .3)
test_that("npMeanSingle, no theta calculation. two-sided",
          expect_true(is.null(res$theta)))

res <- npMeanSingle(x, mu = .3, alternative = "greater")
test_that("npMeanSingle, no theta calculation. greater",
          expect_true(is.null(res$theta)))

res <- npMeanSingle(x, mu = .3, alternative = "less")
test_that("npMeanSingle, no theta calculation. less",
          expect_true(is.null(res$theta)))


##
## transBinomTest
##
lower <- 0
upper <- 1
x <- c(rep(0, 4), rep(.5, 13), rep(1, 20))
x <- (x - lower)/(upper - lower)
n <- length(x)
test_that("transBinomtest, mixed rejection",
          expect_equal({
              set.seed(1); p <- .6; transBinomTest(p, n, 0.03, list(x = x, xp = x - p))
            }, 0.24926764))
test_that("transBinomtest, full rejection",
          expect_equal({
              set.seed(1); p <- .5; transBinomTest(p, n, 0.03, list(x = x, xp = x - p))
            }, 1))
test_that("transBinomtest, no rejection",
          expect_equal({
              set.seed(1); p <- .7; transBinomTest(p, n, 0.03, list(x = x, xp = x - p))
            }, 0))

x <- 1 - c(rep(0, 4), rep(.5, 13), rep(1, 20))
x <- (x - lower)/(upper - lower)
n <- length(x)

test_that("transBinomtest, mixed rejection",
          expect_equal({
              set.seed(1); p <- .175; transBinomTest(p, n, 0.03, list(x = x, xp = x - p))
            }, 0.26506823))

test_that("transBinomtest, full rejection",
          expect_equal({
              set.seed(1); p <- .1; transBinomTest(p, n, 0.03, list(x = x, xp = x - p))
            }, 1))

test_that("transBinomtest, no rejection",
          expect_equal({
              set.seed(1); p <- .2; transBinomTest(p, n, 0.03, list(x = x, xp = x - p))
          }, 0))

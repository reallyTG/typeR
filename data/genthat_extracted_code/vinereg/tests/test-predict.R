context("predict.vinereg()")

# simulate data
set.seed(3)
x <- matrix(rnorm(60), 20, 3)
y <- x %*% c(1, -1, 2)
dat <- data.frame(y = y, x = x, z = as.factor(rbinom(20, 3, 0.5)))
fit <- vinereg(y ~ ., family = "gauss", dat)

test_that("catches missing variables", {
    fit <- vinereg(y ~ ., dat[1:3])
    expect_error(predict(fit, dat[2]))
})

test_that("handles alpha correctly", {
    fit <- vinereg(y ~ ., dat[1:3])
    expect_equal(colnames(predict(fit, alpha = c(NA, 0.5))), c("mean", "0.5"))
    expect_equal(colnames(predict(fit, alpha = c(0.1, 0.5))), c("0.1", "0.5"))
    expect_error(predict(fit, alpha = NULL))
    expect_error(predict(fit, alpha = "0.2"))
    expect_error(predict(fit, alpha = 1.1))
})

test_that("works in bivariate case", {
    fit <- vinereg(y ~ ., dat[1:2])
    expect_silent(predict(fit, dat[2]))
})

test_that("works with continuous response", {
    fit <- vinereg(y ~ ., dat, selcrit = "loglik")
    expect_equal(fitted(fit), predict(fit, dat))
    expect_equal(
        cbind(fitted(fit, alpha = 0.2), fitted(fit, alpha = 0.8)),
        fitted(fit, alpha = c(0.2, 0.8))
    )

    # simulate data
    x <- matrix(rnorm(300), 100, 3)
    y <- x %*% c(1, -1, 2)
    dat <- data.frame(y = y, x = x, z = as.factor(rbinom(100, 3, 0.5)))
    fit <- vinereg(y ~ ., dat, selcrit = "loglik")
    expect_equal(
        unname(coef(lm(dat$y ~ fitted(fit)[[1]]))),
        c(0, 1),
        tol = 1e-1
    )
})

test_that("works with discrete response", {
    dat$y <- as.ordered(dat$y)
    fit <- vinereg(y ~ ., dat, fam = "tll")
    expect_equal(fitted(fit), predict(fit, dat))
    expect_error(fitted(fit, alpha = NA))
})

fit <- vinereg(y ~ ., dat[-5])
u <- vinereg:::get_pits(fit$margins, 1)
fit_uscale <- vinereg(y ~ ., as.data.frame(u), uscale = TRUE)

test_that("works on uscale", {
    expect_warning(
        expect_equal(predict(fit, u, uscale = TRUE), fitted(fit_uscale))
    )
})

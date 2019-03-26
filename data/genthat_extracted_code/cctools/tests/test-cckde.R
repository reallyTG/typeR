context("Continuous convolution kernel density estimator")

# dummy data
set.seed(5)
dat <- data.frame(
    F1 = factor(rbinom(10, 4, 0.1), 0:4),
    Z1 = ordered(rbinom(10, 5, 0.5), 0:5),
    Z2 = ordered(rpois(10, 1), 0:10),
    X1 = rnorm(10),
    X2 = rexp(10)
)

set.seed(5)
fit <- cckde(dat)

test_that("Recognizes discrete variables", {
    expect_length(attr(fit$x_cc, "i_disc"), 6)
})

test_that("Works with numeric and data.frame input", {
    expect_error(cckde(sapply(dat, as.numeric), bw = 0))
})

test_that("bw parameter works", {
    expect_error(cckde(dat, bw = 0))
    expect_error(cckde(dat, bw = rep(0, 8)))
    bw <- rep(0.5, 8)
    names(bw) <- expand_names(dat)
    new_fit <- cckde(dat, bw = bw)
    expect_equal(new_fit$bw, bw)
})

test_that("mult parameter works", {
    expect_error(cckde(dat, mult = 0))
    set.seed(5)
    new_fit <- cckde(dat, mult = 2)
    expect_equal(2 * fit$bw, new_fit$bw)
    set.seed(5)
    new_fit <- cckde(dat, mult = 1:8)
    expect_equal(1:8 * fit$bw, new_fit$bw)
})

test_that("Density works", {
    expect_error(dcckde(dat, 1))
    expect_is(dcckde(dat[1, ], fit), "numeric")
    expect_gte(min(dcckde(dat, fit)), 0)
    expect_equal(dcckde(dat, fit), predict(fit, dat))
})

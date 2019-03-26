context("Expansion functions for categorical variables")

# dummy data
set.seed(5)
dat <- data.frame(
    F1 = factor(rbinom(10, 4, 0.1), 0:4),
    Z1 = ordered(rbinom(10, 5, 0.5), 0:5),
    Z2 = ordered(rpois(10, 1), 0:10),
    X1 = rnorm(10),
    X2 = rexp(10)
)
exp_len <- 8

test_that("returns right type", {
    expect_is(expand_as_numeric(dat), "numeric")
    expect_is(cctools:::expand_vec(rep(0.5, 5), dat), "numeric")
    expect_is(cont_conv(dat), "numeric")
})

test_that("returns right size", {
    expect_equal(dim(expand_as_numeric(dat)), c(nrow(dat), exp_len))
    expect_length(cctools:::expand_vec("a", dat), 8)
    expect_length(cctools:::expand_vec(rep(0.5, 5), dat), 8)
})

test_that("throw error for characters or other", {
    dat$char <- rep("A", 10)
    expect_error(cont_conv(dat))
    dat$char <- complex(1:10)
    expect_error(cont_conv(dat))
})

test_that("has no effect when applied multiple times", {
    dat_xpnd <- expand_as_numeric(dat)
    expect_identical(expand_as_numeric(dat_xpnd), dat_xpnd)
})



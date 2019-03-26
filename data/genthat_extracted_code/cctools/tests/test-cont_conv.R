context("Continuous convolution")

# dummy data
dat <- data.frame(
    F1 = factor(rbinom(10, 4, 0.1), 0:4),
    Z1 = ordered(rbinom(10, 5, 0.5), 0:5),
    Z2 = ordered(rpois(10, 1), 0:10),
    X1 = rnorm(10),
    X2 = rexp(10)
)

test_that("adds noise to the right variables", {
    dat_cc <- cont_conv(dat)
    i_disc <- attr(dat_cc, "i_disc")
    i_cnt <- setdiff(seq.int(ncol(dat)), i_disc)
    sapply(i_cnt, function(i) expect_equal(dat[, i], dat_cc[ , i]))
    sapply(i_cnt, function(i) expect_false(all(dat[, i] == dat_cc[ , i])))
})

test_that("has no effect when applied multiple times", {
    dat_cc <- cont_conv(dat)
    expect_identical(cont_conv(dat_cc), dat_cc)
})

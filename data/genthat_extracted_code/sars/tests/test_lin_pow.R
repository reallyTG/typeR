context("lin_pow")

test_that("lin_pow returns correct results", {
   fit <- lin_pow(galap, con = 1)
   expect_equal(round(fit$Model$coefficients[2], 2), 0.34)
   expect_equal(round(fit$normaTest[[2]]$p.value, 2), 0.35)
})

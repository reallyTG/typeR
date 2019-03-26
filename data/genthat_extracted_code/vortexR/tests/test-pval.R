library(vortexR)
context("test pval")

test_that("test pval", {
    z <- c(1.645, 1.96, 3.09)
    p <- round(pval(z), 3)
    expect_equal(p , c(0.050, 0.025, 0.001))

})

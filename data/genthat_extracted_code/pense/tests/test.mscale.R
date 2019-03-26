test_that("M-scale", {
    expect_identical(pense::mscale(numeric(20)), NA_real_)
    set.seed(12345)
    expect_gt(pense::mscale(rnorm(2)), 0)
    expect_equal(pense::mscale(1 + numeric(10)),
                 pense::mscale(-1 + numeric(10))
    )
})

context("coerce_discrete")

a <- c(1,2,3,4,5,6,7,8,9,10)
b <- c(4,3,3,10,4,1,2,1,10)
aa <- c("high", "low", "high", "normal", "low", "low")

test_that("coerce_discrete works as expected", {
    expect_equal(coerce_discrete(a), a - 1)
    expect_equal(coerce_discrete(b), c(3,2,2,4,3,0,1,0,4))
    expect_equal(coerce_discrete(aa), c(0,1,0,2,1,1))
})

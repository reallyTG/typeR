test_that("Geometric mean calculation", {
    
    x <- c(1,2,3,4,5,6,7,8,9)
    expect_equal(QFASA:::mean.geometric(x), exp(mean(log(x))))
})

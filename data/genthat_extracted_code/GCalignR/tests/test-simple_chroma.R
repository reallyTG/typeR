context("simple_chroma")

library(testthat)
x <- simple_chroma(peaks = c(10,20,25), sd = c(0.1,0.2,0.3))
with(x, plot(x,y))
x <- find_peaks(x)

test_that("output is correct", {
    expect_equal(order(x[["y"]]),c(3,2,1))

})





context("gc_heatmap")

library(testthat)
data("aligned_peak_data")
x <- aligned_peak_data
out <- gc_heatmap(x)

test_that("output is correct", {
    expect_equal(length(out[["data"]][["substance"]]), 22796)

})





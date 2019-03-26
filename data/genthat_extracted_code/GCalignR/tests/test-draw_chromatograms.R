context("draw_chromatogram")

library(testthat)
data("aligned_peak_data")

x <- draw_chromatogram(data = aligned_peak_data, rt_col_name = "time", samples = "M2", show_num = FALSE, plot = F, width = 0.01)

test_that("output is correct", {
    expect_equal(length(x), 2) # list of two elements
    expect_equal(dim(x[["df"]]), c(8594, 5))
})








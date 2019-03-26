context("choose_optimal_reference")

library(testthat)
data("peak_data")

out <- choose_optimal_reference(data = peak_data[1:3],rt_col_name = "time")

test_that("output is correct", {
    expect_equal(out[["sample"]], "C3") # picked reference
    expect_equal(round(out[["score"]],4),  0.0661) # Median deviation
})








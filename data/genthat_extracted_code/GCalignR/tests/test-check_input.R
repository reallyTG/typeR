context("check_input")

library(testthat)
data("peak_data")
x <- check_input(peak_data,reference = NULL,plot = TRUE,main = "TEST", xlab = "Samples",  ylab = "Peaks")

peak_data[["C2"]][["time"]][4] <- "5,6"
d <- peak_data

test_that("output is correct", {
    expect_equal(as.character(x[["sample"]][[78]]), "P41")
    expect_equal(x[["peaks"]][28], 117)
    expect_error(check_input(d,rt_col_name = "RT"), "RT is not a valid variable name. Data contains: time & area")
})






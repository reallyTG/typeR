context("norm_peaks")

library(testthat)
data("aligned_peak_data")

x <- norm_peaks(aligned_peak_data, conc_col_name = "area",out = "list")
y <- as.vector(unlist(lapply(x,sum)))
## supposed to be an artefact, values deviate from 100 by approx. e-15
y <- any(round(y,digits = 10) != 100)

x2 <- norm_peaks(aligned_peak_data, conc_col_name = "area", rt_col_name = "time", out = "data.frame")
## supposed to be an artefact, values deviate from 100 by approx. e-15
y2 <- as.vector(rowSums(x2))
y2 <- any(round(y2) != 100)


data("peak_data")
## subset for faster processing
data <- lapply(peak_data[1:4], function(x) x[22:35,])
x <- align_chromatograms(data, rt_col_name = "time")
out <- remove_blanks(data = x, blanks = c("C2","C3"))
x3 <- norm_peaks(data = out, conc_col_name = "area", rt_col_name = "time", out = "list")


test_that("output is correct", {
    expect_false(y, FALSE)
    expect_false(y2, FALSE)
    #expect_false(any(unlist(lapply(x3, sum)) != 100))
})








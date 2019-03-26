context("plot.GCalign")

library(testthat)
data("aligned_peak_data")
x <- aligned_peak_data
out1 <- plot(x)
out2 <- plot(x,which_plot = 'shifts')
out3 <- plot(x,which_plot = 'variation')



test_that("output is correct", {
    expect_equal(out1, 1)
    expect_equal(sd(out2[["shifts"]]), 0.005119064)
    expect_equal(out3[3,1], 0.04)
})





context("remove_blanks")

library(testthat)
data("peak_data")
## subset for faster processing
data <- lapply(peak_data[1:5], function(x) x[20:40,])
x <- align_chromatograms(data, rt_col_name = "time")

# peaks of C3 & C2
p1 <- length(x[["aligned_list"]][["C3"]][["time"]][x[["aligned_list"]][["C3"]][["time"]] > 0])
p2 <- length(x[["aligned_list"]][["C2"]][["time"]][x[["aligned_list"]][["C2"]][["time"]] > 0])
p3 <- length(peak_data[["C3"]][["time"]][!is.na(peak_data[["C2"]][["time"]])])

# all peaks
n <- length(x[["aligned_list"]][["M2"]][["time"]])
N <- length(peak_data[["M2"]][["time"]])


out <- remove_blanks(data = x, blanks = "C3")
out2 <- remove_blanks(data = x, blanks = "C2")
out3 <- remove_blanks(data = peak_data, blanks = "C2")

n2 <- length(out[["M2"]][["time"]])
n3 <- length(out2[["M2"]][["time"]])
n4 <- length(out3[["M2"]][["time"]])


test_that("output is correct", {
    ## n2 = n-p1
    expect_true(n2 == n - p1)
    expect_true(n3 == n - p2)
    expect_true(n4 == N - p3)
})

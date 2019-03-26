context("align_peaks")

library(testthat)
data("peak_data")
data <- peak_data[1:3]

# remove zeros and NA
data <- lapply(data, FUN = function(x) {
    if (any(is.na(rowSums(x)))) {
        p <- as.vector(which(is.na(rowSums(x))))
        x <- x[-p,]
    }
    if (any(rowSums(x) == 0)) {
        p <- as.vector(which(rowSums(x) == 0))
        x <- x[-p]
    }
    return(x)
})

set.seed(1)
x <- GCalignR:::align_peaks(gc_peak_list = data, rt_col_name = "time")




test_that("output is correct", {
})

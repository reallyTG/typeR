context("align_chromatograms")

library(testthat)
data("peak_data")
data <- peak_data[1:3]
data <- lapply(data, function(x) x[1:60,])

set.seed(1)
out <- align_chromatograms(data, sep = "\t", rt_col_name = "time", write_output = NULL, rt_cutoff_low = NULL, rt_cutoff_high = NULL, reference = "M2",max_linear_shift = 0.05, max_diff_peak2mean = 0.02, min_diff_peak2peak = 0.03, blanks = "C2",delete_single_peak = FALSE)

set.seed(1)
out2 <- align_chromatograms(data, sep = "\t", rt_col_name = "time", write_output = NULL, rt_cutoff_low = 1, rt_cutoff_high = 12, reference = NULL,max_linear_shift = 0.05, max_diff_peak2mean = 0.02, min_diff_peak2peak = 0.03, blanks = NULL,delete_single_peak = TRUE)

test_that("output is correct", {
    expect_equal(out[["Logfile"]][["Aligned"]][["retained"]], 38) # Number of Peaks
    expect_equal(out[["Logfile"]][["Variation"]][["Aligned"]][["Max"]], 0.02) # Variation of Rts
    expect_equal(names(out), c("aligned","heatmap_input","Logfile","aligned_list","input_list","input_matrix")) # Names of the Output
    expect_equal(any(is.na(out[["aligned"]])),FALSE) # No NAs
    expect_that(str(out[["Logfile"]]), prints_text("List of 7"))
    expect_equal(out2[["Logfile"]][["Aligned"]][["retained"]], 51) # Number of Peaks
    expect_equal(out2[["Logfile"]][["Variation"]][["Aligned"]][["Max"]], 0.03) # Variation of Rts
    expect_equal(names(out2), c("aligned","heatmap_input","Logfile","aligned_list","input_list","input_matrix")) # Names of the out2put
    expect_equal(any(is.na(out2[["aligned"]])),FALSE) # No NAs
    expect_that(str(out2[["Logfile"]]), prints_text("List of 7"))
})

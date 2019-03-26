context("linear_transformation")

library(testthat)
data("peak_data")
data <- peak_data[1:5]
data <- lapply(data, function(x) x[1:10,])

set.seed(1)
out <- align_chromatograms(data, sep = "\t", rt_col_name = "time", write_output = NULL, rt_cutoff_low = NULL, rt_cutoff_high = NULL, reference = "M2",max_linear_shift = 0.05, max_diff_peak2mean = 0.02, min_diff_peak2peak = 0.03, blanks = "C2",delete_single_peak = FALSE)

set.seed(1)
out2 <- align_chromatograms(data, sep = "\t", rt_col_name = "time", write_output = NULL, rt_cutoff_low = NULL, rt_cutoff_high = NULL, reference = "M2",max_linear_shift = 0, max_diff_peak2mean = 0.02, min_diff_peak2peak = 0.03, blanks = "C2",delete_single_peak = FALSE)

set.seed(1)
out2 <- align_chromatograms(data, sep = "\t", rt_col_name = "time", write_output = NULL, rt_cutoff_low = NULL, rt_cutoff_high = NULL, reference = "M2",max_linear_shift = 0, max_diff_peak2mean = 0.02, min_diff_peak2peak = 0.03, blanks = "C2",delete_single_peak = FALSE)

set.seed(1)
out4 <- align_chromatograms(data, sep = "\t", rt_col_name = "time", write_output = NULL, rt_cutoff_low = NULL, rt_cutoff_high = NULL, reference = NULL,max_linear_shift = 0, max_diff_peak2mean = 0.02, min_diff_peak2peak = 0.03, blanks = "C2",delete_single_peak = FALSE)

path <- system.file("extdata", "simulated_peak_data.txt", package = "GCalignR")
list <- read_peak_list(data = path, rt_col_name = "rt")
out3 <- linear_transformation(gc_peak_list = list, reference = "A2", max_linear_shift = 2, rt_col_name = "rt", Logbook = list(), step_size = 0.1)

out4 <- linear_transformation(gc_peak_list = peak_data, max_linear_shift = 0, rt_col_name = "time")


test_that("output is correct", {
    expect_equal(sum(out[["heatmap_input"]][["linear_transformed_rts"]][,2:10]), 215.49) #214.95
    expect_equal(sum(out[["heatmap_input"]][["input_rts"]][,2:10]), 214.41) #291
    expect_equal(sum(out2[["heatmap_input"]][["linear_transformed_rts"]][,2:10]), 214.41)
    expect_equal(sum(out2[["heatmap_input"]][["input_rts"]][,2:10]), 214.41) #291
    expect_equal(sum(out3[["Logbook"]][["LinearShift"]][["shift"]]), -1.4)
    expect_equal(lapply(out4[["chroma_aligned"]], function(x) x <- x[1:25,]), lapply(peak_data, function(x) x <- x[1:25,]))
})

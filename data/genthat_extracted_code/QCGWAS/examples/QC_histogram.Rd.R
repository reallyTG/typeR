library(QCGWAS)


### Name: QC_histogram
### Title: Histogram(s) of expected and observed data distribution
### Aliases: QC_histogram histogram_series
### Keywords: distribution

### ** Examples

  data("gwa_sample")

  QC_histogram(dataset = gwa_sample, data_col = "EFFECT",
             save_name = "sample_histogram",
             filter_FRQ = 0.01, filter_cal = 0.95,
             filter_NA = FALSE,
             graph_name = "Effect size histogram")

  histogram_series(dataset = gwa_sample, data_col = "EFFECT",
             save_name = "sample_histogram",
             filter_FRQ = c(NA, 0.01, 0.01),
             filter_cal = c(NA, 0.95, 0.95),
             filter_NA = c(FALSE, FALSE, TRUE))




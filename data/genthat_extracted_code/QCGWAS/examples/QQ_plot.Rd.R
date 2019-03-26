library(QCGWAS)


### Name: QQ_plot
### Title: QQ plot(s) of expected vs. reported p-values
### Aliases: QQ_plot QQ_series
### Keywords: distribution

### ** Examples

  data("gwa_sample")

  QQ_plot(dataset = gwa_sample,
          save_name = "sample_QQ",
          filter_FRQ = 0.01, filter_cal = 0.95,
          filter_NA = FALSE)

  QQ_series(dataset = gwa_sample,
            save_name = "sample_QQ",
            filter_FRQ = c(NA, 0.01, 0.01),
            filter_cal = c(NA, 0.95, 0.95),
            filter_NA = c(FALSE, FALSE, TRUE))




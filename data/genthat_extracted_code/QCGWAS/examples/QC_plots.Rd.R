library(QCGWAS)


### Name: QC_plots
### Title: QQ and Manhattan plots
### Aliases: QC_plots
### Keywords: distribution univar

### ** Examples

  data("gwa_sample")

  QC_plots(dataset = gwa_sample,
    plot_QQ = TRUE, plot_QQ_bands = TRUE, plot_Man = TRUE,
    FRQfilter_values = c(NA, 0.01, 0.05, 3),
    calfilter_values = c(NA, 0.95, 0.99),
    manfilter_FRQ = 0.05, manfilter_cal = 0.95,
    filter_NA = TRUE, save_name = "sample_plots")




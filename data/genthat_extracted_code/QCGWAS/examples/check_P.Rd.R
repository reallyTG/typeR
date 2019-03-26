library(QCGWAS)


### Name: check_P
### Title: Checking GWAS p-values
### Aliases: check_P
### Keywords: univar

### ** Examples

  data("gwa_sample")

  selected_SNPs <- HQ_filter(data = gwa_sample,
                             FRQ_val = 0.05,
                             cal_val = 0.95,
                             filter_NA = FALSE)
  check_P(gwa_sample, HQ_subset = selected_SNPs,
          plot_correlation = TRUE, plot_if_threshold = FALSE,
          save_name = "sample")




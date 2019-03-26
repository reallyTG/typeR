library(QCGWAS)


### Name: HQ_filter
### Title: Select high-quality data in GWAS datasets
### Aliases: HQ_filter

### ** Examples

  data("gwa_sample")

  selected_SNPs <- HQ_filter(data = gwa_sample,
                             FRQ_val = 0.01,
                             cal_val = 0.95,
                             filter_NA = FALSE)
  summary(gwa_sample[selected_SNPs, ])
  
  selected_SNPs <- HQ_filter(data = gwa_sample,
                             FRQ_val = 0.01,
                             cal_val = 0.95,
                             filter_NA = FALSE,
                             ignore_impstatus = TRUE)
  summary(gwa_sample[selected_SNPs, ])




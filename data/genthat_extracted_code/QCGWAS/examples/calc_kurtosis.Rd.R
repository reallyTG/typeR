library(QCGWAS)


### Name: calc_kurtosis
### Title: Skewness and Kurtosis
### Aliases: calc_kurtosis calc_skewness
### Keywords: univar

### ** Examples

  data("gwa_sample")  
  
  calc_kurtosis(gwa_sample$EFFECT)
  calc_kurtosis(gwa_sample)
  calc_kurtosis(gwa_sample$EFF_ALL_FREQ)
  calc_kurtosis(gwa_sample,
                FRQ_val = 0.05, cal_val = 0.95,
                filter_NA = FALSE)




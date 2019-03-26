library(SWMPrExtension)


### Name: sk_seasonal
### Title: Seasonal Kendall Analysis for Seasonal Data
### Aliases: sk_seasonal sk_seasonal.swmpr

### ** Examples

dat_wq <- elksmwq
dat_wq <- qaqc(dat_wq, qaqc_keep = c(0, 3, 5))

x <- sk_seasonal(dat_wq, param = 'temp')





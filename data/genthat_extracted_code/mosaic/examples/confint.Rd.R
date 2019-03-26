library(mosaic)


### Name: confint
### Title: Confidence interval methods for output of resampling
### Aliases: confint confint.numeric confint.do.tbl_df
###   confint.do.data.frame confint.data.frame confint.summary.lm

### ** Examples

if (require(mosaicData)) {
  bootstrap <- do(500) * diffmean( age ~ sex, data=resample(HELPrct) )
  confint(bootstrap)
  confint(bootstrap, method = "percentile")
  confint(bootstrap, method = "boot")
  confint(bootstrap, method = "se", df=nrow(HELPrct) - 1)
  confint(bootstrap, margin.of.error = FALSE)
  confint(bootstrap, margin.of.error = TRUE, level=0.99, method=c("boot", "se", "perc") )
  bootstrap2 <- do(500)*mean( resample(1:10) ) 
  confint(bootstrap2)
}
lm(width ~ length * sex, data = KidsFeet) %>%
  summary() %>%
  confint()




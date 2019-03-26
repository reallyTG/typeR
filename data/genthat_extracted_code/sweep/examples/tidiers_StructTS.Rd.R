library(sweep)


### Name: tidiers_StructTS
### Title: Tidying methods for StructTS (Error, Trend, Seasonal) /
###   exponential smoothing modeling of time series
### Aliases: tidiers_StructTS sw_tidy.StructTS sw_glance.StructTS
###   sw_augment.StructTS

### ** Examples

library(forecast)
library(sweep)

fit_StructTS <- WWWusage %>%
    StructTS()

sw_tidy(fit_StructTS)
sw_glance(fit_StructTS)
sw_augment(fit_StructTS)





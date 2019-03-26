library(sweep)


### Name: tidiers_ets
### Title: Tidying methods for ETS (Error, Trend, Seasonal) exponential
###   smoothing modeling of time series
### Aliases: tidiers_ets sw_tidy.ets sw_glance.ets sw_augment.ets
###   sw_tidy_decomp.ets

### ** Examples

library(forecast)
library(sweep)

fit_ets <- WWWusage %>%
    ets()

sw_tidy(fit_ets)
sw_glance(fit_ets)
sw_augment(fit_ets)
sw_tidy_decomp(fit_ets)





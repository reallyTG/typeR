library(sweep)


### Name: tidiers_HoltWinters
### Title: Tidying methods for HoltWinters modeling of time series
### Aliases: tidiers_HoltWinters sw_tidy.HoltWinters sw_glance.HoltWinters
###   sw_augment.HoltWinters sw_tidy_decomp.HoltWinters

### ** Examples

library(forecast)
library(sweep)

fit_hw <- USAccDeaths %>%
    stats::HoltWinters()

sw_tidy(fit_hw)
sw_glance(fit_hw)
sw_augment(fit_hw)
sw_tidy_decomp(fit_hw)





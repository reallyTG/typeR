library(sweep)


### Name: tidiers_bats
### Title: Tidying methods for BATS and TBATS modeling of time series
### Aliases: tidiers_bats sw_tidy.bats sw_glance.bats sw_augment.bats
###   sw_tidy_decomp.bats

### ** Examples

library(forecast)
library(sweep)

fit_bats <- WWWusage %>%
    bats()

sw_tidy(fit_bats)
sw_glance(fit_bats)
sw_augment(fit_bats)





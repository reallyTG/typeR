library(sweep)


### Name: tidiers_nnetar
### Title: Tidying methods for Nural Network Time Series models
### Aliases: tidiers_nnetar sw_tidy.nnetar sw_glance.nnetar
###   sw_augment.nnetar

### ** Examples

library(forecast)
library(sweep)

fit_nnetar <- lynx %>%
    nnetar()

sw_tidy(fit_nnetar)
sw_glance(fit_nnetar)
sw_augment(fit_nnetar)





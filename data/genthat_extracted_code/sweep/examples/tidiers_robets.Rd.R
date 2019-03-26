library(sweep)


### Name: tidiers_robets
### Title: Tidying methods for robets (Robust Error, Trend, Seasonal)
###   exponential smoothing modeling of time series
### Aliases: tidiers_robets sw_tidy.robets sw_glance.robets
###   sw_augment.robets sw_tidy_decomp.robets

### ** Examples

library(robets)
library(sweep)

fit_robets <- WWWusage %>%
    robets()

sw_tidy(fit_robets)
sw_glance(fit_robets)
sw_augment(fit_robets)
sw_tidy_decomp(fit_robets)





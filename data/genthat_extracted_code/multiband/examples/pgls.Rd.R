library(multiband)


### Name: pgls
### Title: Penalized Generalized Lomb-Scargle
### Aliases: pgls

### ** Examples

period_min <- 3.5
period_max <- 3.65
out <- pgls(cepii,period_min=period_min,period_max=period_max)
out$best_fitBCD




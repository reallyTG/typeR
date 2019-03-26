library(DTAT)


### Name: dose.survfit
### Title: Calculate a dose-survival curve from a dose titration study,
###   adding a confidence band
### Aliases: dose.survfit
### Keywords: survival

### ** Examples

CV <- 0.7; mean_mtd <- 1.0
shape <- CV^-2; scale <- mean_mtd/shape
trial <- new("DE", doses=0.25 * 1.4^(0:6),
             MTDi=rgamma(24, shape=shape, scale=scale),
             units="mg")
trial <- titration(trial, periods=10)
sf <- dose.survfit(trial@data)
summary(sf)





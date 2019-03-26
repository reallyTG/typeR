library(DTAT)


### Name: ds.curve
### Title: Extract the dose-survival curve, with its upper and lower
###   confidence band limits
### Aliases: ds.curve
### Keywords: survival

### ** Examples

CV <- 0.7; mean_mtd <- 1.0
shape <- CV^-2; scale <- mean_mtd/shape
trial <- new("DE", doses=0.25 * 1.4^(0:6),
             MTDi=rgamma(24, shape=shape, scale=scale),
             units="mg")
trial <- titration(trial, periods=10)
ds.curve(trial@data)





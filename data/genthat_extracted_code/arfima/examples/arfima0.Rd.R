library(arfima)


### Name: arfima0
### Title: Exact MLE for ARFIMA The time series is corrected for the sample
###   mean and then exact MLE is used for the other parameters. This is a
###   simplified version of the arfima() function that may be useful in
###   simulations and bootstrapping.
### Aliases: arfima0
### Keywords: ts

### ** Examples


z <- rnorm(100)
arfima0(z, lmodel="FGN")





library(timsac)


### Name: decomp
### Title: Time Series Decomposition (Seasonal Adjustment) by Square-Root
###   Filter
### Aliases: decomp
### Keywords: ts

### ** Examples

data(Blsallfood)
z <- decomp(Blsallfood, trade = TRUE, year = 1973)
z$aic
z$lkhd
z$sigma2
z$tau1
z$tau2
z$tau3




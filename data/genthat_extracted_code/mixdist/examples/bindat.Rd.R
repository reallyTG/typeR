library(mixdist)


### Name: bindat
### Title: Grouped Binomial Data
### Aliases: bindat
### Keywords: datasets

### ** Examples

data(bindat)
data(binpar)
plot.mixdata(bindat)
fit <- mix(bindat, binpar, "binom", mixconstr(conpi = "PFX",
           fixpi = c(TRUE, TRUE, TRUE, TRUE), consigma = "BINOM", size = c(20, 20, 20, 20)))
fit
plot(fit)




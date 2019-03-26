library(oce)


### Name: tidem
### Title: Fit a Tidem (Tidal Model) to a Timeseries
### Aliases: tidem

### ** Examples

library(oce)
# The demonstration time series from Foreman (1977),
# also used in T_TIDE (Pawlowicz, 2002).
data(sealevelTuktoyaktuk)
tide <- tidem(sealevelTuktoyaktuk)
summary(tide)

# AIC analysis
extractAIC(tide[["model"]])

# Fake data at M2
t <- seq(0, 10*86400, 3600)
eta <- sin(0.080511401 * t * 2 * pi / 3600)
sl <- as.sealevel(eta)
m <- tidem(sl)
summary(m)





library(lfstat)


### Name: ev_return_period
### Title: Estimate the return period for given quantiles
### Aliases: ev_return_period
### Keywords: low-flow fitting

### ** Examples

data("ngaruroro")
ng <- as.xts(ngaruroro)

# yearly minima
minima <- apply.yearly(ng$discharge, min, na.rm = TRUE)

# fit a Weibull distribution
fit <- evfit(x = as.vector(minima), distribution = "wei")

# compute return periods
minima$rp <- round(ev_return_period(minima, fit), 2)

print(minima)
plot(discharge ~ rp, data = minima,
     xlab = "Flow in m^3/s", ylab = "Return period in years")




library(thief)


### Name: reconcilethief
### Title: Reconcile temporal hierarchical forecasts
### Aliases: reconcilethief

### ** Examples

# Construct aggregates
aggts <- tsaggregates(USAccDeaths)

# Compute forecasts
fc <- list()
for(i in seq_along(aggts))
  fc[[i]] <- forecast(auto.arima(aggts[[i]]), h=2*frequency(aggts[[i]]))

# Reconcile forecasts
reconciled <- reconcilethief(fc)

# Plot forecasts before and after reconcilation
par(mfrow=c(2,3))
for(i in seq_along(fc))
{
  plot(reconciled[[i]], main=names(aggts)[i])
  lines(fc[[i]]$mean, col='red')
}





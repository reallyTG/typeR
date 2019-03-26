library(TSstudio)


### Name: ts_lags
### Title: Time Series Lag Visualization
### Aliases: ts_lags

### ** Examples

data(USgas)

# Plot the first 12 lags (default)
ts_lags(USgas) 

# Plot the seasonal lags for the first 4 years (hence, lag 12, 24, 36, 48)
ts_lags(USgas, lags = c(12, 24, 36, 48))

# Setting the margin between the plot
ts_lags(USgas, lags = c(12, 24, 36, 48), margin = 0.01)




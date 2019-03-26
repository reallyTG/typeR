library(dsa)


### Name: daily_sim
### Title: Create a simple, exemplary, seasonal, daily time series
### Aliases: daily_sim

### ** Examples

time_series <- daily_sim(n=4, year_effect=3)
xtsplot(time_series[,1], font="sans") # Plot of the time series
xtsplot(time_series[,3:5], font="sans") # Plot of the seasonal factors




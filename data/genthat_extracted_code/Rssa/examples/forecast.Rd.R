library(Rssa)


### Name: forecast
### Title: Perform SSA forecasting of series
### Aliases: forecast.ssa forecast.1d.ssa forecast.toeplitz.ssa predict.ssa
###   predict.1d.ssa predict.mssa predict.toeplitz.ssa

### ** Examples

s <- ssa(co2)
# Calculate 24-point forecast using first 6 components as a base
f <- forecast(s, groups = list(1:6), method = "recurrent", bootstrap = TRUE, len = 24, R = 10)
## No test: 
# Plot the result including the last 24 points of the series
plot(f, include = 24, shadecols = "green", type = "l")
# Use of predict() for prediction
p <- predict(s, groups = list(1:6), method = "recurrent", len = 24)
# Simple plotting
plot(p, ylab = "Forecasteed Values")
## End(No test)




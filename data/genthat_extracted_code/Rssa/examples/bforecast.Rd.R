library(Rssa)


### Name: bforecast
### Title: Perform bootstrap SSA forecasting of the series
### Aliases: bforecast bforecast.default bforecast.ssa bforecast.1d.ssa
###   bforecast.toeplitz.ssa

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2)
# Produce 24 forecasted values and confidence bounds of the series using
# the first 3 eigentriples as a base space for the forecast.
## No test: 
f <- bforecast(s, groups = list(1:3), len = 24, R = 50)
matplot(f, col = c("black", "red", "red"), type='l')
## End(No test)




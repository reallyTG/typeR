library(Rssa)


### Name: rforecast
### Title: Perform recurrent SSA forecasting of the series
### Aliases: rforecast rforecast.default rforecast.ssa rforecast.1d.ssa
###   rforecast.toeplitz.ssa rforecast.mssa rforecast.cssa
###   rforecast.pssa.1d.ssa

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2)
# Produce 24 forecasted values of the series using different sets of eigentriples
# as a base space for the forecast.
rfor <- rforecast(s, groups = list(c(1,4), 1:4), len = 24, only.new=FALSE)
matplot(data.frame(c(co2, rep(NA, 24)), rfor), type = "l")

# Forecast `co2' trend by SSA with projections
s <- ssa(co2, column.projector = 2, row.projector = 2)
len <- 100
rfor <- rforecast(s, groups = list(trend = seq_len(nspecial(s))), len = len, only.new = FALSE)
matplot(data.frame(c(co2, rep(NA, len)), rfor), type = "l")

# Forecast finite rank series with polynomial component by SSA with projections
v <- 5000 * sin(2*pi / 13 * (1:100)) +  (1:100)^2 + 10000
s <- ssa(v, row.projector = 2, column.projector = 2)
plot(rforecast(s, groups = list(all = 1:6), len = 100, only.new = FALSE), type = "l")




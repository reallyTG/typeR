library(cointmonitoR)


### Name: monitorStationarity
### Title: Procedure for Monitoring Level and Trend Stationarity
### Aliases: monitorStationarity

### ** Examples

set.seed(1909)
x <- rnorm(200)
x2 <- c(x[1:100], cumsum(x[101:200]) / 2)

# Specify the calibration period
# as fraction of the total length of x:
monitorStationarity(x, m = 0.25)
monitorStationarity(x2, m = 0.465)

# Specify the calibration period
# by setting its last observation exactly:
monitorStationarity(x, m = 50)
monitorStationarity(x2, m = 93)





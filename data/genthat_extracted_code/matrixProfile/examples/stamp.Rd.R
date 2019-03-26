library(matrixProfile)


### Name: stamp
### Title: Scalable Time series Anytime Matrix Profile (stamp)
### Aliases: stamp
### Keywords: matrix profile distance profile time series motif discovery

### ** Examples

# data input
dt = AirPassengers
dt = as.vector(dt)

# generates matrix profile
stamp <- stamp(q = dt[1:12], t = dt[-c(1:12)])

# plotting
par(mfrow = c(2,1))
plot(dt, type = "l", main = "Original Timeseries")
plot(stamp$MP, type = "l", main = "Matrix Profile", xlim = c(0, length(dt)))




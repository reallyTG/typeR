library(carfima)


### Name: carfima.sim
### Title: Simulating a CARFIMA(p,H,q) time series
### Aliases: carfima.sim

### ** Examples

##### Irregularly spaced observation time generation.
##### For CRAN testing, time is set to be very short.

length.time <- 10
time.temp <- rexp(length.time, rate = 2)
time <- rep(NA, length.time + 1)
time[1] <- 0
for (i in 2 : (length.time + 1)) {
  time[i] <- time[i - 1] + time.temp[i - 1]
}
time <- time[-1]

##### Data genration for CARFIMA(1, H, 0) based on the observation times. 

parameter <- c(-0.4, 0.75, 0.2) 
# AR parameter alpha = -0.4
# Hurst parameter = 0.75
# process uncertainty sigma = 0.2
y <- carfima.sim(parameter = parameter, time = time, ar.p = 1, ma.q = 0)  

 




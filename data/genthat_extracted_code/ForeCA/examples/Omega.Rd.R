library(ForeCA)


### Name: Omega
### Title: Estimate forecastability of a time series
### Aliases: Omega
### Keywords: math univar

### ** Examples


nn <- 100
eps <- rnorm(nn)  # white noise has Omega() = 0 in theory
Omega(eps, spectrum.control = list(method = "direct")) 
# smoothing makes it closer to 0
Omega(eps, spectrum.control = list(method = "wosa"))

xx <- sin(seq_len(nn) * pi / 10)
Omega(xx, spectrum.control = list(method = "direct"))
Omega(xx, entropy.control = list(threshold = 1/40)) 
Omega(xx, spectrum.control = list(method = "wosa"), 
      entropy.control = list(threshold = 1/20))

# an AR(1) with phi = 0.5
yy <- arima.sim(n = nn, model = list(ar = 0.5))
Omega(yy, spectrum.control = list(method = "wosa"))

# an AR(1) with phi = 0.9 is more forecastable
yy <- arima.sim(n = nn, model = list(ar = 0.9))
Omega(yy, spectrum.control = list(method = "wosa"))





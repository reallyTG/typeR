library(LSTS)


### Name: block.smooth.periodogram
### Title: Smooth Periodogram by blocks
### Aliases: block.smooth.periodogram
### Keywords: Fourier smooth timeseries

### ** Examples

## Require "rdatamarket"
library(rdatamarket)

malleco = dmlist("22tn")
mammothcreek = dmlist("22r7")


## Example 1
block.smooth.periodogram(y = malleco$Value, x = malleco$Year, spar.freq = .7,
                         spar.time = .7, theta = 30, phi =  0, N = 300, S = 50, 
                         ylim = c(1200,2000), ylab = "Year")
block.smooth.periodogram(y = malleco$Value, x = malleco$Year, spar.freq = .7, 
                         spar.time = .7, theta = 45, phi = 45, N = 300, S = 50,
                         ylim = c(1200,2000), ylab = "Year")
block.smooth.periodogram(y = malleco$Value, x = malleco$Year, spar.freq = .7, 
                         spar.time = .7, theta = 90, phi =  0, N = 300, S = 50,
                         ylim = c(1200,2000), ylab = "Year")

## Example 2
block.smooth.periodogram(y = mammothcreek$Value, x = mammothcreek$Year, spar.freq = .7,
                         spar.time = .7, theta = 30, phi =  0, N = 400, S = 50,
                         ylim = c(-10,2000), ylab = "Year")
block.smooth.periodogram(y = mammothcreek$Value, x = mammothcreek$Year, spar.freq = .7,
                         spar.time = .7, theta = 45, phi = 45, N = 400, S = 50, 
                         ylim = c(-10,2000), ylab = "Year")
block.smooth.periodogram(y = mammothcreek$Value, x = mammothcreek$Year, spar.freq = .7, 
                         spar.time = .7, theta = 90, phi = 0, N = 400, S = 50, 
                         ylim = c(-10,2000), ylab = "Year")

## Example 3: Simulated AR(2)
set.seed(2015)
ts.sim = arima.sim(n = 1000, model = list(order = c(2,0,0), ar = c(1.3, -0.6)))
block.smooth.periodogram(y = ts.sim, spar.freq = .9, spar.time = .9, theta = 30, phi = 00, 
                         N = 500, S = 100, ylab = "Time")
block.smooth.periodogram(y = ts.sim, spar.freq = .9, spar.time = .9, theta = 00, phi = 00, 
                         N = 500, S = 100, ylab = "Time")
block.smooth.periodogram(y = ts.sim, spar.freq = .9, spar.time = .9, theta = 90, phi = 00,
                         N = 500, S = 100, ylab = "Time")
block.smooth.periodogram(y = ts.sim, spar.freq = .9, spar.time = .9, theta = 45, phi = 15, 
                         N = 500, S = 100, ylab = "Time")
block.smooth.periodogram(y = ts.sim, spar.freq = .9, spar.time = .9, theta = 45, phi = 15, 
                         N = 500, S = 100, ylab = "Time", 
                         palette.col = gray(level = seq(0.2,0.9,0.1 )))




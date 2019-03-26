library(adespatial)


### Name: mfpa
### Title: Multi-frequential periodogram analysis
### Aliases: mfpa plot.mfpa print.mfpa

### ** Examples


### Example 1

# Simulate data with frequencies 2.3 and 6.1 and a random component, n = 100. 
# No trend, no autocorrelated residuals.

y <- as.matrix(0.4*(sin(2.3*2*pi*(1:100)/100)) +
0.4*(sin(6.1*2*pi*(1:100)/100)) + 0.2*rnorm(100))

res <- mfpa(y, MaxNFreq = 2, MinFreq = 2, ntrend = 0, nlags = 0)

# Compute the periods associated with the two periodic components. Each
# frequency in element $frequencies is a number of cycles in the whole series.
# The periods are expressed in numbers of time intervals of the data series. In
# this example, if the data are measured every min, the periods are in min.

periods <- 100/res$frequencies$frequency 

# Draw the data series and the fitted (or predicted) values

plot(res)

### Example 2

# Generate hourly periodic data with tide signal (tide period T = 12.42 h)
# during 1 year, hence 24*365 = 8760 hourly data. See
# https://en.wikipedia.org/wiki/Tide.

# In this simulation, constant (c = 0) puts the maximum value of the cosine at
# midnight on the first day of the series.

periodic.component <- function(x, T, c) cos((2*pi/T)*(x+c))

tide.h <- periodic.component(1:8760, 12.42, 0)

# The number of tides in the series is: 8760/12.42 = 705.314 tidal cycles
# during one year.

# Sample the hourly data series once a day at 12:00 noon every day. The
# periodic signal to be detected has a period smaller then the interval between
# consecutive observations and its frequency is larger than (n–1). The sequence
# of sampling hours for the tide.h data is:

h.noon <- seq(12, 8760, 24) 
tide.data <- tide.h[h.noon]
length(tide.data)   

# The series contains 365 sampling units

# Compute Dutilleul’s multi-frequential periodogram

res.noon <- mfpa(tide.data, MaxNFreq = 1, MinFreq = 2, ntrend = 1, nlags = 2)

# Examine the frequency detected by the periodogram, element
# res.noon$frequencies. This is a harmonic of the tide signal in the original
# data series tide.h.

# Compute the period of the signal in the data series sampled hourly:

period <- 365/res.noon$frequencies$frequency

# Draw the data series and the adjusted values

plot(res.noon)

# Repeat this analysis after addition of random noise to the tide data

tide.noise <- tide.data + rnorm(365, 0, 0.25)

res.noise <- mfpa(tide.noise, MaxNFreq = 1, MinFreq = 2, ntrend = 1, nlags = 2)

plot(res.noise)





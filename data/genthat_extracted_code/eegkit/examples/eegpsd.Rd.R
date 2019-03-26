library(eegkit)


### Name: eegpsd
### Title: Plots Power Spectral Density of EEG Data
### Aliases: eegpsd

### ** Examples


##########   EXAMPLE   ##########

# create data generating signals
n <- 1000                             # 1000 Hz signal
s <- 2                                # 2 seconds of data
t <- seq(0, s, length.out = s * n)    # time vector
s1 <- sin(2*pi*t)                     # 1 Hz sinusoid
s5 <- sin(2*pi*t*5)                   # 5 Hz sinusoid
s10 <- sin(2*pi*t*10)                 # 10 Hz sinusoid
s20 <- sin(2*pi*t*20)                 # 20 Hz sinusoid

# create data
set.seed(1)                           # set random seed
e <- rnorm(s * n, sd = 0.25)          # Gaussian error
mu <- s1 + s5 + s10 + s20             # 1 + 5 + 10 + 20 Hz mean
y <- mu + e                           # data = mean + error

# plot psd (single channel)
eegpsd(y, Fs = n, upper = 30, t = "b")

# plot psd (multi-channel)
ym <- cbind(s1, s5, s10, s20)
eegpsd(ym, Fs = n, upper = 30, units = "mV")





library(signal)


### Name: signal-package
### Title: Signal processing
### Aliases: signal-package signal
### Keywords: package

### ** Examples

## The R implementation of these routines can be called "matlab-style",
bf <- butter(5, 0.2)
freqz(bf$b, bf$a)
## or "R-style" as:
freqz(bf)

## make a Chebyshev type II filter:
ch <- cheby2(5, 20, 0.2) 
freqz(ch, Fs = 100)  # frequency plot for a sample rate = 100 Hz

zplane(ch) # look at the poles and zeros

## apply the filter to a signal
t <- seq(0, 1, by = 0.01)                     # 1 second sample, Fs = 100 Hz
x <- sin(2*pi*t*2.3) + 0.25*rnorm(length(t))  # 2.3 Hz sinusoid+noise
z <- filter(ch, x)  # apply filter
plot(t, x, type = "l")
lines(t, z, col = "red")

# look at the group delay as a function of frequency
grpdelay(ch, Fs = 100)




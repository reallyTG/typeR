library(biosignalEMG)


### Name: onoff_bonato
### Title: Automatic on/off detection algorithm based on a double threshold
###   scheme
### Aliases: onoff_bonato
### Keywords: manip

### ** Examples

# Load a data.frame with EMG data
data(emg95306000)
# Coerce a data.frame into an 'emg' object
x <- as.emg(emg95306000, samplingrate = 1000, units = "mV")

# change graphical parameters to show multiple plots
op <- par(mfrow = c(2, 1))

# Estimate 'sigma_n' from the last 200 samples (only baseline noise)
sigma_n <- sd(tail(x$values, 200))

# Detect the phases of activation in x
b <- onoff_bonato(x, sigma_n = sigma_n, m = 10, minL = 30)

# Plot 'x' and the detected phases
plot(x, main = "Sample EMG")
plot(b, type = "l", main = "Detected phases (Bonato's method)")

# reset graphical parameters
par(op)




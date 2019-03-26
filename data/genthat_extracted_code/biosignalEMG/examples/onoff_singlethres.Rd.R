library(biosignalEMG)


### Name: onoff_singlethres
### Title: Automatic on/off detection algorithm based on a simple threshold
###   rule
### Aliases: onoff_singlethres
### Keywords: manip

### ** Examples

# Load a data.frame with EMG data
data(emg95306000)
# Coerce a data.frame into an 'emg' object
x <- as.emg(emg95306000, samplingrate = 1000, units = "mV")

# change graphical parameters to show multiple plots
op <- par(mfrow = c(2, 1))

# Detect the phases of activation in x
b <- onoff_singlethres(x, t = 0.1)

# Plot 'x' and the detected phases
plot(x, main = "Sample EMG")
plot(b, type = "l", main = "Detected phases (single thresholding)")

# reset graphical parameters
par(op)




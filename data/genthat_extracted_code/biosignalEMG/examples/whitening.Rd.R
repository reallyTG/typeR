library(biosignalEMG)


### Name: whitening
### Title: Decorrelates an EMG signal
### Aliases: whitening
### Keywords: manip

### ** Examples

# Load a data.frame with EMG data
data(emg95306000)
# Coerce a data.frame into an 'emg' object
x <- as.emg(emg95306000, samplingrate = 1000, units = "mV")

# Whitening x
y <- whitening(x)

# change graphical parameters to show multiple plots
op <- par(mfrow = c(2, 1))

# plot the original channel and the corresponding whitened channel
plot(x, main = "Original  channel")
plot(y, main = "Whitened channel")

# reset graphical parameters
par(op)




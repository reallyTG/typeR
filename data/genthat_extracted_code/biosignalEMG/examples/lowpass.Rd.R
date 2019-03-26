library(biosignalEMG)


### Name: lowpass
### Title: Lowpass filter an EMG signal
### Aliases: lowpass
### Keywords: manip

### ** Examples

# This example computes the LE-envelope using the lowpass routine
# Load a data.frame with EMG data
data(emg95306000)
# Coerce a data.frame into an 'emg' object
x <- as.emg(emg95306000, samplingrate = 1000, units = "mV")

# Compute the rectified signal
x_rect <- rectification(x)

# Filter the rectified signal
y <- lowpass(x_rect, cutoff = 100)

# change graphical parameters to show multiple plots
op <- par(mfrow = c(3, 1))

# plot the original channel, the filtered channel and the 
# LE-envelope
plot(x, channel = 1, main = "Original  channel")
plot(x_rect, main = "Rectified  channel")
plot(y, main = "LE-envelope")

# reset graphical parameters
par(op)




library(biosignalEMG)


### Name: highpass
### Title: Highpass filter an EMG signal
### Aliases: highpass
### Keywords: manip

### ** Examples

# Load a data.frame with EMG data
data(emg95306000)
# Coerce a data.frame into an 'emg' object
x <- as.emg(emg95306000, samplingrate = 1000, units = "mV")

# Filter the fourth channel in x
y <- highpass(x, cutoff = 100)

# change graphical parameters to show multiple plots
op <- par(mfcol = c(2, 2))

# Compute the rectified signals to see the effect of the filter
x_rect <- rectification(x)
y_rect <- rectification(y)

# plot the original channel, the filtered channel and the corresponding
# rectified signals
plot(x, channel = 1, main = "Original  channel")
plot(y, main = "Highpass filtered channel")
plot(x_rect, main = "Rectified  channel")
plot(y_rect, main = "Rectified highpass filtered channel")

# reset graphical parameters
par(op)




library(biosignalEMG)


### Name: dcbiasremoval
### Title: Remove the DC bias
### Aliases: dcbiasremoval
### Keywords: manip

### ** Examples

# change graphical parameters to show multiple plots
op <- par(mfrow = c(2, 1))

# Creates a random vector to simulate a baseline noise with a DC-offset
x <- rnorm(1000, 1, 1)
emg1 <- emg(x, samplingrate = 1000, units = "mV", data.name = "")
plot(emg1, main = "Simulated EMG with a DC-offset")
abline(h = mean(emg1$values), col = "red", lwd = 2)  # Show the position of the overall mean

# Remove the baseline noise mean
emg2 <- dcbiasremoval(emg1)
plot(emg2, main = "Simulated EMG with an overall zero mean")
abline(h = mean(emg2$values), col = "red", lwd = 2)  # Show the position of the overall mean

# reset graphical parameters
par(op)




library(biosignalEMG)


### Name: print.summary.emg
### Title: Shows the content of an 'emg' summary on the console
### Aliases: print.summary.emg
### Keywords: internal

### ** Examples

# Creates a random vector to simulate an EMG signal
x <- rnorm(10000, 0, 1)
# Creates an 'emg' object to store x
emg1 <- emg(x, samplingrate = 1000, units = "mV", data.name = "")
# Summarize and visualize the data
summary(emg1)




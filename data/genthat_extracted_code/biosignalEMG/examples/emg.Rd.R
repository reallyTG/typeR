library(biosignalEMG)


### Name: emg
### Title: EMG object
### Aliases: emg plot.emg print.emg summary.emg
### Keywords: graphs manip

### ** Examples

# Creates a random vector to simulate an EMG signal
x <- rnorm(10000, 0, 1)
# Creates an 'emg' object to store x 
emg1 <- emg(x, samplingrate=1000, units="mV", data.name="")
## Don't show: 
print.emg(emg1)
## End(Don't show)
# Summarize and visualize the data 
summary(emg1)
plot(emg1, main="Simulated EMG")



library(biosignalEMG)


### Name: emg96627009
### Title: Sample EMG data from a decorticate cat (4 channels)
### Aliases: emg96627009
### Keywords: datasets

### ** Examples

# Load data
data(emg96627009)
# Coerce data into an 'emg' object
x <- as.emg(emg96627009, samplingrate=2500, units="mV")
summary(x)




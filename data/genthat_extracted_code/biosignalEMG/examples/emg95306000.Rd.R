library(biosignalEMG)


### Name: emg95306000
### Title: Sample EMG data from a decorticate cat
### Aliases: emg95306000
### Keywords: datasets

### ** Examples

# Load data
data(emg95306000)
# Coerce data into an 'emg' object
x <- as.emg(emg95306000, samplingrate=1000, units="mV")
plot(x, main = "EMG of limb muscles of decorticated cat")




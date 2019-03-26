library(biosignalEMG)


### Name: as.emg
### Title: Coerce to an 'emg' object
### Aliases: as.emg as.emg.default as.emg.numeric as.emg.matrix
###   as.emg.data.frame is.emg
### Keywords: manip

### ** Examples

# Creates 1 sec. of a simulated EMG with only baseline noise
x <- rnorm(1000)
# Coerce a vector into an 'emg' object
emgx <- as.emg(x, sampligrate = 1000)
# Plot the data in emgx
plot(emgx, main = "Synthetic EMG noise")

# Load a data.frame with EMG data
data(emg96627009)
# Coerce a data.frame into an 'emg' object
x <- as.emg(emg96627009)
# Plot the data in x
plot(x, main = "EMG of limb muscles of decorticated cat")




library(biosignalEMG)


### Name: extractchannel
### Title: Extracts a single channel from a multichannel 'emg' object
### Aliases: extractchannel
### Keywords: manip

### ** Examples

# Load a data.frame with EMG data
data(emg96627009)
# Coerce a data.frame into an 'emg' object
x <- as.emg(emg96627009)

# Extract the second channel in x
y <- extractchannel(x, 2)
# Plot the data in y
plot(y, main = "Second channel of emg96627009")

# Extract the channel 'ENG-FDL' in x (third channel)
z <- extractchannel(x, "ENG-FDL")
# Plot the data in z
plot(z, main = "Third channel of emg96627009")




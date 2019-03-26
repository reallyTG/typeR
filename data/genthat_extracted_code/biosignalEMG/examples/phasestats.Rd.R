library(biosignalEMG)


### Name: phasestats
### Title: local statistics of each phase on an EMG (beta)
### Aliases: phasestats
### Keywords: manip

### ** Examples

# Load a data.frame with EMG data
data(emg95306000)
# Coerce a data.frame into an 'emg' object
x <- as.emg(emg95306000, samplingrate = 1000, units = "mV")

# Detect the phases of activation in x
b <- onoff_singlethres(x, t = 0.1)

# Computes the length of the detected phases
plengths<-phasestats(x,b,length)
plengths
# Computes the mean of the values within the detected phases
pmeans<-phasestats(x,b,mean)
pmeans

# Only show the means of the active phases
pmeans$stats[names(pmeans$stats)==1]





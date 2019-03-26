library(astrochron)


### Name: taner
### Title: Apply Taner bandpass or lowpass filter to stratigraphic series
### Aliases: taner

### ** Examples

# generate example series with periods of 405 ka, 100 ka, 40ka, and 20 ka, plus noise
ex=cycles(freqs=c(1/405,1/100,1/40,1/20),end=1000,dt=5,noisevar=.1)

# bandpass precession term using Taner window 
bandpass_ex <- taner(ex,flow=0.045,fhigh=0.055,roll=10^10)

# lowpass filter eccentricity terms using Taner window
lowpass_ex=taner(ex,fhigh=.02,roll=10^10)

# notch filter (remove) obliquity term using Taner window
#  if you'd like the final notch filtered record to be centered on the mean proxy 
#  value, set addmean=FALSE
notch_ex <- taner(ex,flow=0.02,fhigh=0.03,roll=10^10,addmean=FALSE)
notch_ex[2] <- ex[2]-notch_ex[2]
pl(2)
plot(ex,type="l",main="Eccentricity+Obliquity+Precession")
plot(notch_ex,type="l",main="Following application of obliquity notch filter")

# highpass filter obliquity and precession terms using Taner window
#  if you'd like the final highpass filtered record to be centered on the mean proxy 
#  value, set addmean=FALSE
highpass_ex=taner(ex,fhigh=.02,roll=10^10,addmean=FALSE)
highpass_ex[2] <- ex[2]-highpass_ex[2]
pl(2)
plot(ex,type="l",main="Eccentricity+Obliquity+Precession")
plot(highpass_ex,type="l",main="Obliquity+Precession highpassed signal")




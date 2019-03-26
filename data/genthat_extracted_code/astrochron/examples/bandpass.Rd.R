library(astrochron)


### Name: bandpass
### Title: Bandpass filter stratigraphic series
### Aliases: bandpass

### ** Examples

# generate example series with periods of 405 ka, 100 ka, 40ka, and 20 ka, plus noise
ex=cycles(freqs=c(1/405,1/100,1/40,1/20),end=1000,dt=5,noisevar=.1)

# bandpass precession term using cosine-tapered window 
bandpass_ex <- bandpass(ex,flow=0.045,fhigh=0.055,win=2,p=.4)

# notch filter (remove) obliquity term using cosine-tapered window
#  if you'd like the final notch filtered record to be centered on the mean proxy 
#  value, set addmean=FALSE
notch_ex <- bandpass(ex,flow=0.02,fhigh=0.03,win=2,p=.4,addmean=FALSE)
notch_ex[2] <- ex[2]-notch_ex[2]
pl(2)
plot(ex,type="l",main="Eccentricity+Obliquity+Precession")
plot(notch_ex,type="l",main="Following application of obliquity notch filter")




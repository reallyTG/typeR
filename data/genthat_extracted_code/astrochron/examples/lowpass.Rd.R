library(astrochron)


### Name: lowpass
### Title: Lowpass filter stratigraphic series
### Aliases: lowpass

### ** Examples

# generate example series with periods of 405 ka, 100 ka, 40ka, and 20 ka, plus noise
ex=cycles(freqs=c(1/405,1/100,1/40,1/20),end=1000,dt=5,noisevar=.1)

# lowpass filter eccentricity terms using cosine-tapered window
lowpass_ex=lowpass(ex,fcut=.02,win=2,p=.4)

# highpass filter obliquity and precession terms using cosine-tapered window
#  if you'd like the final notch filtered record to be centered on the mean proxy 
#  value, set addmean=FALSE
highpass_ex=lowpass(ex,fcut=.02,win=2,p=.4,addmean=FALSE)
highpass_ex[2] <- ex[2]-highpass_ex[2]
pl(2)
plot(ex,type="l",main="Eccentricity+Obliquity+Precession")
plot(highpass_ex,type="l",main="Obliquity+Precession highpassed signal")





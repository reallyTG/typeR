library(astrochron)


### Name: astrochron-package
### Title: astrochron: A Computational Tool for Astrochronology
### Aliases: astrochron-package astrochron
### Keywords: package

### ** Examples

### EXAMPLES OF SOME FUNCTIONS AVAILABLE IN THIS SOFTWARE:

### This demo will use a model (series are usually read using the function 'read').
data(modelA)

### Interpolate the model stratigraphic series to its median sampling interval
modelAInterp=linterp(modelA)

### Calculate MTM spectrum using 2pi Slepian tapers, include AR1 condfidence level estimates,
###  plot power with linear scale
mtm(modelAInterp,tbw=2,ar=TRUE,pl=2)

### Perform Evolutive Harmonic Analysis using 2pi Slepian tapers, a window of 8 meters,
###  pad to 1000 points, and output Harmonic F-test confidence level results
fCL=eha(modelAInterp,win=8,pad=1000,output=4)

### Extract Harmonic F-test spectrum at approximately 22 meters height
spec=extract(fCL,22)
### In this extracted spectrum, identify F-test peak maxima exceeding 90% confidence level
freqs=peak(spec,level=0.9)[2]
### Conduct ASM testing on these peaks
# set Rayleigh frequency in cycles/m
rayleigh=0.1245274
# set Nyquist frequency in cycles/m
nyquist=6.66597
# set orbital target in 1/ky
target=c(1/405.47,1/126.98,1/96.91,1/37.66,1/22.42,1/18.33)
# execute ASM
asm(freq=freqs,target=target,rayleigh=rayleigh,nyquist=nyquist,sedmin=0.5,sedmax=3,numsed=100,
    linLog=1,iter=100000,output=FALSE)

# Check to see if this is an interactive R session, for compliance with CRAN standards.
# YOU SHOULD SKIP THE FOLLOWING LINE IF YOU ARE USING AN INTERACTIVE SESSION.
if(interactive()) {

### Interactively track obliquity term in EHA harmonic F-test confidence level results
freqs=trackFreq(fCL,fmin=1.2,fmax=2.4,threshold=0.8)

### Convert the spatial frequencies to sedimentation rates
sedrate=freq2sedrate(freqs,period=37.66)

### Convert the sedimentation rate curve to a time-space map
time=sedrate2time(sedrate)

### Tune the stratigraphic series using the time-space map
modelATuned=tune(modelAInterp,time)

### Interpolate the tuned series
modelATunedInterp=linterp(modelATuned)

### Perform Evolutive Harmonic Analysis on the tuned series
eha(modelATunedInterp)

}





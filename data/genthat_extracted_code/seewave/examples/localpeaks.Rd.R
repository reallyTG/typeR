library(seewave)


### Name: localpeaks
### Title: Local maximum frequency peak detection
### Aliases: localpeaks
### Keywords: dplot ts

### ** Examples

data(sheep)
spec <- meanspec(sheep, f=8000)
# a specific number of bands with all the same size
localpeaks(spec, bands=5)
# bands directly specified  with a regular sequence
localpeaks(spec, bands=seq(0,8/2,by=0.5))
# bands directly specified  with an irregular sequence
localpeaks(spec, bands=c(0,0.5,1,1.5,3,4))
# Amaj octave bands, note that there is no peak detection
# in the higher part of the spectrum as sequence stops at 3520 Hz
localpeaks(spec, bands=octaves(440, below=3, above=3)/1000)
# melscale
require(tuneR)
mel <- melfcc(sheep, nbands = 256, dcttype = "t3", fbtype = "htkmel", spec_out=TRUE)
melspec.mean <- apply(mel$aspectrum, MARGIN=2, FUN=mean)
melspec.mean <- melspec.mean/max(melspec.mean) # [0,1] scaling 
localpeaks(melspec.mean, f=8000, bands=8)




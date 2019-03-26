library(seewave)


### Name: phaseplot
### Title: Phase-phase 2D or 3D plot of a time wave
### Aliases: phaseplot
### Keywords: dplot ts

### ** Examples

## Not run: 
##D require(rgl)
##D data(tico)
##D phaseplot(tico)
## End(Not run)
s <- synth(d=0.05, f=44100, cf=440, out="Wave")
n <- noisew(d=0.05, f=44100, out="Wave")
par(mfrow=c(2,1))
phaseplot(s, dim=2)
phaseplot(n, dim=2)




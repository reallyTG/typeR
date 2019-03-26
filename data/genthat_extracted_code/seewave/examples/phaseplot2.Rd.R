library(seewave)


### Name: phaseplot2
### Title: Phase-phase 2D plot of a time wave
### Aliases: phaseplot2
### Keywords: dplot ts

### ** Examples

s <- synth(d=0.05, f=44100, cf=440, out="Wave")
n <- noisew(d=0.05, f=44100, out="Wave")
par(mfrow=c(2,1))
phaseplot2(s)
phaseplot2(n)




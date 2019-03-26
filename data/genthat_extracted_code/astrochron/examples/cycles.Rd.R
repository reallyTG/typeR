library(astrochron)


### Name: cycles
### Title: Generate harmonic model
### Aliases: cycles

### ** Examples

## test signal on pg 38 of Choudhury, Shah, and Thornhill (2008)
freqs=c(0.12,0.18,0.30,0.42)
phase=c(-pi/3,-pi/12,-pi/4,-3*pi/8)
amp=c(1,1,1,1)

cycles(freqs,phase,amp,start=0,end=4095,dt=1,noisevar=0.2)




library(astrochron)


### Name: eha
### Title: Evolutive Harmonic Analysis & Evolutive Power Spectral Analysis
### Aliases: eha

### ** Examples

## as an example, evaluate the modelA
data(modelA)

## interpolate to even sampling interval of 0.075 m
ex1=linterp(modelA, dt=0.075)
  
## perform EHA with a time-bandwidth parameter of 2, using an 7.95 meter window, 0.15 m step, 
## and pad to 1000 points
## set labels for plots (optional)
eha(ex1,tbw=2,win=7.95,step=0.15,pad=1000,xlab="Frequency (cycles/m)",ylab="Height (m)")

## for comparison generate spectrum for entire record, using time-bandwidth parameter of 3, and 
## pad to 5000 points
## start by making a new plot
pl(1)
eha(ex1,tbw=3,win=38,pad=5000,xlab="Frequency (cycles/m)")




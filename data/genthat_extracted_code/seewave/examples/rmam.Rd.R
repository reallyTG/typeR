library(seewave)


### Name: rmam
### Title: Remove the amplitude modulations of a time wave
### Aliases: rmam
### Keywords: ts

### ** Examples

# generate a new sound with amplitude modulation
a<-synth(f=8000, d=1, cf=1500, am=c(50,10))
# remove the amplitude modulation and plot the result
rmam(a,f=8000,plot=TRUE)




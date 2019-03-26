library(seewave)


### Name: setenv
### Title: Set the amplitude envelope of a time wave to another one
### Aliases: setenv
### Keywords: datagen ts

### ** Examples

data(tico)
a<-synth(d=1,f=22050,cf=1000)
# apply 'tico' ammplitude envelope to 'a' that has a square amplitude envelope
setenv(a,tico,f=22050,plot=TRUE)
# the same but with smoothing the envelope
setenv(a,tico,f=22050,ksmooth=kernel("daniell",50),plot=TRUE)




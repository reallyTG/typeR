library(seewave)


### Name: noisew
### Title: Generate noise
### Aliases: noisew
### Keywords: datagen ts

### ** Examples

# add noise to a synthetic signal
a<-noisew(d=1,f=8000)
b<-synth(f=8000,d=1,cf=2000,plot=FALSE)
c<-a+b
spectro(c,f=8000)




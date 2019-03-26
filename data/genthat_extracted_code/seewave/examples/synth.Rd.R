library(seewave)


### Name: synth
### Title: Synthesis of time wave (additive model)
### Aliases: synth
### Keywords: datagen ts

### ** Examples

## You can use plot=TRUE and spectro() options
## to directly 'see' the new-built sounds
f <- 8000 # sampling frequency
d <- 1    # duration (1 s)
cf <- 440 # carrier frequecy (440 Hz, i.e. flat A tone)
# pure sinusoidal tone
s <- synth(f=f,d=d,cf=cf)
# pure triangular tone
s <- synth(f=f,d=d,cf=cf, signal="tria")
# pure tone with triangle overall shape
s <- synth(f=f,d=d,cf=cf,shape="tria")
# pure tones with am
s <- synth(f=f,d=d,cf=cf,am=c(50,10))
# pure tones with am
# and phase shift of pi radian (180 degrees)
s <- synth(f=f,d=d,cf=cf,am=c(50,10,pi))
# pure tone with +1000 Hz linear fm 
s <- synth(f=f,d=d,cf=cf,fm=c(0,0,1000,0,0))
# pure tone with sinusoidal fm
# (maximum excursion of 250 Hz, frequency of 10 Hz)
s <- synth(f=f,d=d,cf=cf,fm=c(250,10,0,0,0))
# pure tone with sinusoidal fm
# (maximum excursion of 250 Hz, frequency of 10 Hz,
# phase shift of pi radian (180 degrees))
s <- synth(f=f,d=d,cf=cf,fm=c(250,10,0, pi,0))
# pure tone with sinusoidal am
# (maximum excursion of 250 Hz, frequency of 10 Hz)
# and linear fm (maximum excursion of 500 Hz)
s <- synth(f=f,d=d,cf=cf,fm=c(250,10,500,0,0))
# the same with am
s <- synth(f=f,d=d,cf=cf,am=c(50,10), fm=c(250,10,250,0,0))
# the same with am and a triangular overall shape 
s <- synth(f=f,d=d,cf=cf,shape="tria",am=c(50,10), fm=c(250,10,250,0,0))
# an harmonic sound
s <- synth(f=f,d=d,cf=cf, harmonics=c(1, 0.5, 0.25))
# a clarinet-like sound
clarinet <- c(1, 0, 0.5, 0, 0.14, 0, 0.5, 0, 0.12, 0, 0.17)
s <- synth(f=f, d=d, cf = 235.5, harmonics=clarinet)
# inharmonic FM sound built 'manually'
fm <- c(250,5,0,0,0)
F1<-synth(f=f,d=d,cf=cf,fm=fm)
F2<-synth(f=f,d=d,a=0.8,cf=cf*2,fm=fm)
F3<-synth(f=f,d=d,a=0.6,cf=cf*3.5,fm=fm)
F4<-synth(f=f,d=d,a=0.4,cf=cf*6,fm=fm)
final1<-F1+F2+F3+F4
spectro(final1,f=f,wl=512,ovlp=75,scale=FALSE)




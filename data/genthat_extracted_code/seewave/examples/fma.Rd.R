library(seewave)


### Name: fma
### Title: Frequency modulation analysis
### Aliases: fma
### Keywords: dplot ts

### ** Examples

# a sound with a 1 kHz sinusoid FM
a<-synth(d=1, f=8000, cf=1500, fm=c(1000,1000,0,0,0), output="Wave")
fma(a)




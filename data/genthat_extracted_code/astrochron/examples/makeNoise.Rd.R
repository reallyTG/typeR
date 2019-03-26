library(astrochron)


### Name: makeNoise
### Title: Generate noise surrogates from a theoretical power spectrum
### Aliases: makeNoise

### ** Examples

# create theoretical AR1 spectrum, using rho of 0.8
rho=0.8
freq=seq(0,.5,by=0.005)
Nyq=max(freq)
AR1 = (1-(0.8^2)) / (  1 - (2*0.8*cos(pi*freq/Nyq)) + (0.8^2) )
plot(freq,AR1,type="l")

# make noise surrogates from the theoretical AR1 spectrum
makeNoise(AR1)




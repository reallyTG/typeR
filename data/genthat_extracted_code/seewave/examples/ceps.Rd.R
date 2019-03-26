library(seewave)


### Name: ceps
### Title: Cepstrum or real cepstrum
### Aliases: ceps
### Keywords: dplot ts

### ** Examples

data(sheep)
par(mfrow=c(2,1))
# phase not taken into account
ceps(sheep,f=8000,at=0.4,wl=1024)
# phase taken into account
ceps(sheep,f=8000,at=0.4,wl=1024, phase=TRUE)




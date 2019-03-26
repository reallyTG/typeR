library(seewave)


### Name: H
### Title: Total entropy
### Aliases: H
### Keywords: ts

### ** Examples

data(orni)
H(orni,f=22050)
# changing the spectral parameter (wl)
H(orni,f=22050,wl=1024)
# changing the temporal parameter (msmooth)
H(orni,f=22050,msmooth=c(20,0))




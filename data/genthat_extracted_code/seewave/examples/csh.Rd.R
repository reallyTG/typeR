library(seewave)


### Name: csh
### Title: Continuous spectral entropy
### Aliases: csh
### Keywords: ts

### ** Examples

data(orni)
csh(orni,f=22050,wl=512,ovlp=50)
# using the threshold argument can lead to some edge effets
# here sh=1 at the end of echemes
csh(orni,f=22050,wl=512,ovlp=50,threshold=5)




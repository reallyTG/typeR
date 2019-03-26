library(emuR)


### Name: freqtoint
### Title: Function to find the column number corresponding to frequencies
###   of a spectral object
### Aliases: freqtoint
### Keywords: math

### ** Examples


freqtoint(fric.dft,1000:2000)
# all frequencies except 1000-2000
freqtoint(vowlax.dft.5, -(1000:2000))
# all frequencies except 1000 Hz
freqtoint(e.dft, -1000)
# the d.c. offset - i.e. column 1
freqtoint(vowlax.dft.5, 0)
# all freqs except the d.c. offset - i.e. not column 1
freqtoint(vowlax.dft.5, -1)








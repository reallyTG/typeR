library(emuR)


### Name: trackfreq
### Title: function to find the frequencies of a spectral object
### Aliases: trackfreq
### Keywords: attribute

### ** Examples


trackfreq(vowlax.dft.5)
# Frequency components between 1000 and 2000 Hz
trackfreq(vowlax.dft.5[,1000:2000])
# All frequency components of a trackdata object except the d.c. offset
trackfreq(fric.dft[,-1])
# All frequency components except the d.c. offset
# and except frequencies above 5000 Hz
trackfreq(fric.dft[,-c(1, 5000:20000)])
# Note the following syntax if the spectral object is a vector
# Frequencies 1000-3000 Hz
trackfreq(e.dft[1000:3000])







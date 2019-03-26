library(emuR)


### Name: moments
### Title: Function to calculate statistical moments
### Aliases: moments
### Keywords: math

### ** Examples


# first four moments of a vector
mom <- moments(bridge[,2])
# the above is the same as moments(bridge[,2], 0:12)
# first four moments of a spectral vector with the dB values
# reset so that the minimum dB value is 0. The d.c. offset is also
# excluded in the calculation
mom <- moments(e.dft[-1], minval=TRUE)
# the temporal skew of F1 for the 10th segment. Use
m <- moments(vowlax.fdat[10,1]$data)[3]






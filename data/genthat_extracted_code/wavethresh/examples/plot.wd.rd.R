library(wavethresh)


### Name: plot.wd
### Title: Plot wavelet transform coefficients.
### Aliases: plot.wd
### Keywords: hplot smooth

### ** Examples

#
# Generate some test data
#
test.data <- example.1()$y
## Not run: ts.plot(test.data)
#
# Decompose test.data and plot the wavelet coefficients
#
wds <- wd(test.data)
## Not run: plot(wds)
#
# Now do the time-ordered non-decimated wavelet transform of the same thing
#
## Not run: wdS <- wd(test.data, type="station")
## Not run: plot(wdS)
#
# Next examples
# ------------
# The chirp signal is also another good examples to use.
#
# Generate some test data
#
test.chirp <- simchirp()$y
## Not run: ts.plot(test.chirp, main="Simulated chirp signal")
#
# Now let's do the time-ordered non-decimated wavelet transform.
# For a change let's use Daubechies least-asymmetric phase wavelet with 8
# vanishing moments (a totally arbitrary choice, please don't read
# anything into it).
#
chirpwdS <- wd(test.chirp, filter.number=8, family="DaubLeAsymm", type="station")
## Not run: plot(chirpwdS, main="TOND WT of Chirp signal")




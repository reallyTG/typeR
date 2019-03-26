library(wavethresh)


### Name: wst
### Title: Packet-ordered non-decimated wavelet transform.
### Aliases: wst
### Keywords: math smooth nonlinear

### ** Examples

#
# Let's look at the packet-ordered non-decimated wavelet transform
# of the data we used to do the time-ordered non-decimated wavelet
# transform exhibited in the help page for wd. 
#
test.data <- example.1()$y
#
# Plot it to see what it looks like (piecewise polynomial)
#
## Not run: ts.plot(test.data)
#
# Now let's do the packet-ordered non-decimated wavelet transform.
#
TDwst <- wst(test.data)
#
# And let's plot it....
#
## Not run: plot(TDwst)
#
# The coefficients in this plot at each resolution level are the same
# as the ones in the non-decimated transform plot in the wd
# help page except they are in a different order. For more information
# about how the ordering works in each case see
# Nason, Sapatinas and Sawczenko, 1998. 
# 
# Next examples
# ------------
# The chirp signal is also another good examples to use.
#
#
# Generate some test data
#
test.chirp <- simchirp()$y
## Not run: ts.plot(test.chirp, main="Simulated chirp signal")
#
# Now let's do the packet-ordered non-decimated wavelet transform.
# For a change let's use Daubechies extremal phase wavelet with 6
# vanishing moments (a totally arbitrary choice, please don't read
# anything into it).
#
chirpwst <- wst(test.chirp, filter.number=6, family="DaubExPhase")
## Not run: plot(chirpwst, main="POND WT of Chirp signal")




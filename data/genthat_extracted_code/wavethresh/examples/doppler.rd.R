library(wavethresh)


### Name: doppler
### Title: Evaluate the Donoho and Johnstone Doppler signal.
### Aliases: doppler
### Keywords: nonparametric

### ** Examples

#
# Evalute the Doppler signal at 100 arbitrarily spaced points.
#
tt <- sort(runif(100))
dopp <- doppler(tt)
## Not run: plot(tt, dopp, type="l")




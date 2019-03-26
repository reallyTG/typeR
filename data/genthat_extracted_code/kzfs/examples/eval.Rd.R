library(kzfs)


### Name: kzpdr.eval
### Title: Evaluate Directional Spectrum Data for Wave Frequencies and
###   Directions
### Aliases: kzpdr.eval kzpdr.estimate
### Keywords: directional-periodogram

### ** Examples

# load pre-saved data to save running-time
data(kzpdr.demo);  

# estimate the wave parameters
kzpdr.eval(kzpdr.demo, t.D = 3, t.F = 0.01)

# estimation & visualization
kzpdr.estimate(kzpdr.demo)

# For validation of the estimation, see \code{kzpdr.valid}
# For reconstruction of the signals, see \code{kzrc}




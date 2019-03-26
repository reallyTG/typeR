library(emuR)


### Name: tracktimes
### Title: Get the track times from EMU trackdata objects
### Aliases: tracktimes
### Keywords: datagen

### ** Examples


# track time values for a trackdata object
times <- tracktimes(vowlax.fdat)
# track time values for a matrix of trackdata values
# at  the temporal midpoint
tracktimes(dcut(vowlax.fdat[1:3,], 0.5, prop=TRUE))





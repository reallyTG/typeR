library(photobiology)


### Name: calc_multipliers
### Title: Spectral weights
### Aliases: calc_multipliers

### ** Examples

with(sun.data, calc_multipliers(w.length, new_waveband(400,700),"photon"))
with(sun.data, calc_multipliers(w.length, new_waveband(400,700),"photon"), use.cached.mult = TRUE)





library(photobiology)


### Name: photons_energy_ratio
### Title: Photon:energy ratio
### Aliases: photons_energy_ratio

### ** Examples

# photons:energy ratio
with(sun.data, photons_energy_ratio(w.length, s.e.irrad, new_waveband(400,500)))
# photons:energy ratio for whole spectrum
with(sun.data, photons_energy_ratio(w.length, s.e.irrad))





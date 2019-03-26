library(photobiology)


### Name: is_photon_based
### Title: Query if a spectrum contains photon- or energy-based data.
### Aliases: is_photon_based is_energy_based

### ** Examples

is_photon_based(sun.spct)
my.spct <- dplyr::select(sun.spct, w.length, s.e.irrad)
is.source_spct(my.spct)
is_photon_based(my.spct)

is_energy_based(sun.spct)
my.spct <- dplyr::select(sun.spct, w.length, s.q.irrad)
is.source_spct(my.spct)
is_energy_based(my.spct)





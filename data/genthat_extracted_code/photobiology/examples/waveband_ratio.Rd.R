library(photobiology)


### Name: waveband_ratio
### Title: Photon or energy ratio
### Aliases: waveband_ratio

### ** Examples

# photon:photon ratio
with(sun.data,
     waveband_ratio(w.length, s.e.irrad,
                    new_waveband(400,500),
                    new_waveband(400,700), "photon"))
# energy:energy ratio
with(sun.data,
     waveband_ratio(w.length, s.e.irrad,
                    new_waveband(400,500),
                    new_waveband(400,700), "energy"))
# energy:photon ratio
with(sun.data,
     waveband_ratio(w.length, s.e.irrad,
                    new_waveband(400,700),
                    new_waveband(400,700),
                    "energy", "photon"))
# photon:photon ratio waveband : whole spectrum
with(sun.data,
     waveband_ratio(w.length, s.e.irrad,
                    new_waveband(400,500),
                    unit.out.num="photon"))
# photon:photon ratio of whole spectrum should be equal to 1.0
with(sun.data,
     waveband_ratio(w.length, s.e.irrad,
     unit.out.num="photon"))





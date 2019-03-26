library(libamtrack)


### Name: AT.max.electron.ranges.m
### Title: AT.max.electron.ranges.m
### Aliases: AT.max.electron.ranges.m

### ** Examples


# Compute the electron range in PMMA for the Tabata parametrization between
# 0.3 keV and 30 MeV
AT.max.electron.ranges.m( E.MeV.u     = 0.3 * 10^(-4:2),
                          material.no = 4,
                          er.model    = 7)




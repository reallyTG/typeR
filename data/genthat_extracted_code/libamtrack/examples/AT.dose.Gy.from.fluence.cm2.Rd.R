library(libamtrack)


### Name: AT.dose.Gy.from.fluence.cm2
### Title: AT.dose.Gy.from.fluence.cm2
### Aliases: AT.dose.Gy.from.fluence.cm2

### ** Examples

# Compute dose from protons, He-3, C-12 and O-16 at
# same energy and fluence in air
AT.dose.Gy.from.fluence.cm2( E.MeV.u      = c(10, 10, 10, 10),
                             fluence.cm2  = c(1e7, 1e7, 1e7, 1e7),
                             particle.no  = c(1001, 2003, 6012, 8016),
                             material.no  = 7,
                             stopping.power.source.no = 2)




library(libamtrack)


### Name: AT.dose.weighted.E.MeV.u
### Title: AT.dose.weighted.E.MeV.u
### Aliases: AT.dose.weighted.E.MeV.u

### ** Examples

# fluence- and dose-weighted mean energy for a simple mixed field
# of high and low (99/1) energy protons
AT.fluence.weighted.E.MeV.u( E.MeV.u       = c(100, 1),
                             fluence.cm2   = c(99e8, 1e8)) 
AT.dose.weighted.E.MeV.u( E.MeV.u       = c(100, 1),
                          particle.no   = c(1001, 1001),
                          fluence.cm2   = c(99e8, 1e8), 
                          material.no   = 1,                   # water
                                   stopping.power.source.no = 2)   




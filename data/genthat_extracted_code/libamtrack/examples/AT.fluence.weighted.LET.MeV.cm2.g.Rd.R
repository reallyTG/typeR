library(libamtrack)


### Name: AT.fluence.weighted.LET.MeV.cm2.g
### Title: AT.fluence.weighted.LET.MeV.cm2.g
### Aliases: AT.fluence.weighted.LET.MeV.cm2.g

### ** Examples

# fluence- and dose-weighted LET for a simple mixed field
# of high and low (99/1) energy protons
AT.fluence.weighted.LET.MeV.cm2.g( E.MeV.u       = c(100, 5),
                                   particle.no   = c(1001, 1001),
                                   fluence.cm2   = c(99e8, 1e8), 
                                   material.no   = 1,                   # water
                                   stopping.power.source.no = 2)              
AT.dose.weighted.LET.MeV.cm2.g( E.MeV.u       = c(100, 5),
                                particle.no   = c(1001, 1001),
                                  fluence.cm2   = c(99e8, 1e8), 
                                material.no   = 1,                   # water
                                   stopping.power.source.no = 2)              




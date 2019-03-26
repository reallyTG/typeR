library(libamtrack)


### Name: AT.total.D.Gy
### Title: AT.total.D.Gy
### Aliases: AT.total.D.Gy

### ** Examples

# Compute dose of monoenergtic high energy
# and a mixed (99/1) field of high and low 
# energy protons in water at same fluence
AT.total.D.Gy( E.MeV.u     = 100,
               particle.no = 1001, 
               fluence.cm2 = 100e8, 
               material.no = 1,
               stopping.power.source.no = 2)
AT.total.D.Gy( E.MeV.u     = c(100, 5),
               particle.no = c(1001, 1001), 
               fluence.cm2 = c(99e8, 1e8), 
               material.no = 1,
               stopping.power.source.no = 2)




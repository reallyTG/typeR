library(libamtrack)


### Name: AT.total.fluence.cm2
### Title: AT.total.fluence.cm2
### Aliases: AT.total.fluence.cm2

### ** Examples

# Compute total fluence in a 
# and a mixed field of
# high and low energy protons
# that deliver the same dose to water
AT.total.fluence.cm2( E.MeV.u     = c(100, 5),
                      particle.no = c(1001, 1001), 
                      D.Gy        = c(1, 1), 
                      material.no = 1,
                      stopping.power.source.no = 2)




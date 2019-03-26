library(vortexR)


### Name: Nadults
### Title: Calculate the harmonic mean of the total number of adults
### Aliases: Nadults

### ** Examples

# Using Pacioni et al. example data. See ?pac.yr for more details.
data(pac.yr)
NadultAll <- Nadults(data=pac.yr[[2]], scenarios='all', gen=2.54, yr0=50,
                     yrt=120, save2disk=FALSE)




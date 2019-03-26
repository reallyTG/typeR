library(libamtrack)


### Name: AT.beam.par.technical.to.physical
### Title: AT.beam.par.technical.to.physical
### Aliases: AT.beam.par.technical.to.physical

### ** Examples

# Get peak dose of a 142.66 MeV protons in Alox
# from technical beam parameters
peak.fluence.cm2 <- AT.beam.par.technical.to.physical(  N        = 3.2e8, 
                                                        FWHM.mm  = 15.2)[1]
AT.dose.Gy.from.fluence.cm2( E.MeV.u     = 142.66,
                             particle.no =
 AT.particle.no.from.particle.name("1H"),
                             material.no =
 AT.material.no.from.material.name("Aluminum Oxide"),
                             fluence.cm2 = peak.fluence.cm2,
                             stopping.power.source.no = 2)




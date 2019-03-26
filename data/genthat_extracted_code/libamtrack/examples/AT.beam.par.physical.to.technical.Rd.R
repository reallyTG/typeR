library(libamtrack)


### Name: AT.beam.par.physical.to.technical
### Title: AT.beam.par.physical.to.technical
### Aliases: AT.beam.par.physical.to.technical

### ** Examples

# Technical parameters for a double Gaussian beam
# of Carbon ions at 270 MeV/u in water with 
# 0.5 cm sigma width and 1 Gy in the peak
AT.beam.par.physical.to.technical(  fluence.cm2 = AT.fluence.cm2.from.dose.Gy(
 E.MeV.u      = 270, 
                                                                              
 D.Gy         = 1.0, 
                                                                              
 particle.no  = AT.particle.no.from.particle.name("12C"), 
                                                                              
 material.no  = AT.material.no.from.material.name("Water, Liquid"),
                                                                              
 stopping.power.source.no = 2), 
                                    sigma.cm    = 0.5)




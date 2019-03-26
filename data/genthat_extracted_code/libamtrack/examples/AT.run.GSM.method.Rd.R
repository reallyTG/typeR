library(libamtrack)


### Name: AT.run.GSM.method
### Title: AT.run.GSM.method
### Aliases: AT.run.GSM.method

### ** Examples

# Compute the relative efficiency of an Alanine detector
#  in a proton field
AT.run.GSM.method( # protons
                   particle.no                          = 1001,
                   # with 10 MeV/u
                   E.MeV.u                              = 10, 
                   # delivering 1 Gy
                   fluence.cm2.or.dose.Gy               = c(-1.0),
                   # i.e. Alanine
                   material.no                          = 5,
                   
# simple 'Geiss' parametrization of radial dose distribution                   
                   rdd.model                            = 3,
                   # with 50 nm core radius
                   rdd.parameter                        = 50e-9,
                   # M. Scholz' parametrization of track radius
                   er.model                             = 4,
                   # Use exponential saturation
                   gamma.model                          = 4,
                   # max. response normalized to 1, saturation dose 500 Gy
                   gamma.parameters                     = c(1,500),
                   # resample 1000 times
                   N.runs                               = 1000,
                   # write a log file
                   write.output                         = TRUE,
                   # use a 10x10 grid
                   nX                                   = 10,
                   # with 5 nm voxel size
                   voxel.size.m                         = 5e-9,
                   # use independent subtargets
                   lethal.events.mode                   = FALSE,
                   # and PSTAR stopping powers
                   stopping.power.source.no             = 2)                  
    




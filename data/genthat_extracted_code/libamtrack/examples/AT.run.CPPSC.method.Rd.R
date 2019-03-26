library(libamtrack)


### Name: AT.run.CPPSC.method
### Title: AT.run.CPPSC.method
### Aliases: AT.run.CPPSC.method

### ** Examples

# Compute the relative efficiency of an Alanine detector in a mixed
# carbon / proton field
AT.run.CPPSC.method( particle.no                          = c(6012, 1001,
 1001),         # namely carbon, protons, and protons with
                     E.MeV.u                              = c(270, 270, 5),   
           
# 270 MeV/u (primary Carbon, 270 MeV/u and 5 MeV/u (fast and slow proton
# component) 
                     fluence.cm2.or.dose.Gy               = c(1e8, 1e9, 1e7), 
           # and their corresponding fluences
                     material.no                          = 5,                
           # i.e. Alanine
                     rdd.model                            = 3,                
           # simple 'Geiss' parametrization of radial dose distribution
                     rdd.parameter                        = 50e-9,            
           # with 50 nm core radius
                     er.model                             = 4,                
           # M. Scholz' parametrization of track radius
                     gamma.model                          = 2,                
           # General hit/target X ray response, but
                     gamma.parameters                     = c(1,500,1,1,0),   
           
# as simple single exponential saturation (one hit, one target), saturation
# dose 500 Gy
                     N2                                   = 10,               
           # ten bins per factor 2 for internal local dose histogramming
                     fluence.factor                       = 1.0,              
           # can be used to easily scale total fluence (historical)
                     write.output                         = TRUE,             
           # write a log file
                     shrink.tails                         = TRUE,             
           # cut tails of local dose distribution, if...
                     shrink.tails.under                   = 1e-30,            
           # ... they contribute less then 1e-30 to first moment of histogram
                     adjust.N2                            = TRUE,             
           # perform rebinning if local dose distribution becomes too narrow
                     lethal.events.mode                   = FALSE,            
           # use independent subtargets
                     stopping.power.source.no             = 2)                
      




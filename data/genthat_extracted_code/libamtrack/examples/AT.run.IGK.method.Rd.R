library(libamtrack)


### Name: AT.run.IGK.method
### Title: AT.run.IGK.method
### Aliases: AT.run.IGK.method

### ** Examples

# Compute the relative efficiency of an Alanine detector in a mixed
# carbon / proton field
AT.run.IGK.method( particle.no                          = 1001,               
         # namely protons with
                   E.MeV.u                              = 10,                 
         # 10 MeV/u
                   fluence.cm2.or.dose.Gy               = c(-1.0),            
         # delivering 1 Gy
                   material.no                          = 5,                  
         # i.e. Alanine
                   rdd.model                            = 4,                  
         
# Katz parametrization of radial dose distribution with simplified extended
# targets
                   rdd.parameter                        = c(5e-8,1e-10),      
         # with 50 nm target size and 1e-10 dose minimum
                   er.model                             = 2,                  
         # Butts&Katz parametrization of track radius
                   gamma.model                          = 2,                  
         # Use general target/hit model but here...
                   gamma.parameters                     = c(1,500,1,1,0),     
         # ...as exponential saturation with characteristic dose 500 Gy
                   saturation.cross.section.factor      = 1.4,                
         # factor to take 'brush' around track into account
                   write.output                         = TRUE,               
         # write a log file
                   stopping.power.source.no             = 2)                  
    




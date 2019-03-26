library(libamtrack)


### Name: libamtrack-package
### Title: libamtrack package
### Aliases: libamtrack-package libamtrack
### Keywords: package

### ** Examples

##############################################################################
############################ 1. LET ##########################################
cat("Compute the LET (in keV/um) of a 270 MeV/u carbon ion in Aluminum\n")
cat("using the PSTAR stopping power data:\n")
AT.Stopping.Power( E.MeV.u               = 270,
                   particle.no           =
 AT.particle.no.from.particle.name("12C"),
                   material.no           =
 AT.material.no.from.material.name("Aluminum"),
                   stopping.power.source = "PSTAR")
                  
cat("... and in water:\n")
AT.Stopping.Power( E.MeV.u               = 270,
                   particle.no           =
 AT.particle.no.from.particle.name("12C"),
                   material.no           =
 AT.material.no.from.material.name("Water, Liquid"),
                   stopping.power.source = "PSTAR")
###############################################################################

# 2. DOSE AROUND A TRACK 
cat
("Compare the Geiss parametrization for protons and Carbon at different energies:\n"
)
df    <-    expand.grid(    E.MeV.u           = 10^seq(0, 3, length.out = 4), 
      # from 1 to 1000 MeV/u in 4 steps
                            particle.no       = c(1001,6012),                 
      # protons and carbons
                            r.m               = 10^seq(-9, -2, length.out =
 100),   # from 1 nm to 1 cm in 100 steps
                            material.no       = 2,                            
      # Aluminium Oxide
                            rdd.model         = 3,                            
      # Geiss parametrization
                            rdd.parameter     = 5e-8,                         
      # Fixed core size of 50 nm
                            er.model          = 4,                            
      # Geiss track width parametrization
                            D.Gy              = 0)                            
      # For later use
ii                   <-  df$particle.no == 1001                               
      # Add particle names
df$particle.name     <-  "Carbon-12"
df$particle.name[ii] <-  "Protons"
for (i in 1:nrow(df)){                                                        
      # Loop through particles/energies
    df$D.Gy[i]    <-    AT.D.RDD.Gy(     r.m              = df$r.m[i],
                                         E.MeV.u          = df$E.MeV.u[i],
                                         particle.no      = df$particle.no[i],
                                         material.no      = df$material.no[i],
                                         rdd.model        = df$rdd.model[i],
                                         rdd.parameter    =
 df$rdd.parameter[i],
                                         er.model         = df$er.model[i],
                                         stopping.power.source.no            
 = 2)[[1]]                           # use PSTAR data
}
lattice::xyplot( log10(D.Gy) ~ log10(r.m)|particle.name,                      
               # Plot
                 df,
                 type      = 'l',
                 groups    = E.MeV.u,
                 auto.key  = TRUE)[c(2,1)]
        
#####################################################################
#################### 3. DETECTOR EFFICIENCY #########################
cat("Compute the relative efficiency of Alanine in 10 MeV protons\n")
cat("Waligorskis version of the Katz' model\n")
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
         # use PSTAR data




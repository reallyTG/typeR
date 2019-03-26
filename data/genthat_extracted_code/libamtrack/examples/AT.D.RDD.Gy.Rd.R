library(libamtrack)


### Name: AT.D.RDD.Gy
### Title: AT.D.RDD.Gy
### Aliases: AT.D.RDD.Gy

### ** Examples


# Compute dose in several distances of an 100 MeV/u neon ion in water
# according to 'Site' parametrization
AT.D.RDD.Gy(    r.m              = 10^(-9:-4),
                E.MeV.u          = 100,
                particle.no      = 10020,
                material.no      = 1,
                rdd.model        = 4,
                rdd.parameter    = c(5e-8, 1e-10),
                er.model         = 2,
                stopping.power.source.no = 2)

# Compare the Geiss parametrization of RDD for protons and Carbon ions at
# different energies:
df    <-    expand.grid( E.MeV.u        = 10^seq(0, 3, length.out = 4),      
 # from 1 to 1000 MeV/u in 4 steps
                         particle.no    = c(1001,6012),                      
 # protons and carbons
                         r.m            = 10^seq(-9, -2, length.out = 100),  
 # from 1 nm to 1 cm in 100 steps
                         material.no    = 2,                                 
 # Aluminium Oxide
                         rdd.model      = 3,                                 
 # Geiss parametrization
                         rdd.parameter  = 5e-8,                              
 # Fixed core size of 50 nm
                         er.model       = 4,                                 
 # Geiss track width parametrization
                         D.Gy           = 0)                                 
 # For later use
ii                   <-  df$particle.no == 1001                              
 # Add particle names
df$particle.name     <-  "Carbon-12"
df$particle.name[ii] <-  "Protons"
for (i in 1:nrow(df)){                                                       
 # Loop through particles/energies
    df$D.Gy[i]    <-    AT.D.RDD.Gy( r.m              = df$r.m[i],
                                     E.MeV.u          = df$E.MeV.u[i],
                                     particle.no      = df$particle.no[i],
                                     material.no      = df$material.no[i],
                                     rdd.model        = df$rdd.model[i],
                                     rdd.parameter    = df$rdd.parameter[i],
                                     er.model         = df$er.model[i],
                                     stopping.power.source.no = 2)$D.RDD.Gy
}




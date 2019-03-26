library(libamtrack)


### Name: AT.stopping.power.ratio
### Title: AT.stopping.power.ratio
### Aliases: AT.stopping.power.ratio

### ** Examples

df                <-    expand.grid( particle.name         = "1H",            
                          # Define parameter space:
                                     particle.energy.MeV.u = 10^seq(-1, 3,
 length.out = 500),           # 1 nuclid, energy between 0.1 and 1000 MeV/u,
                                     material.name         = c("Air", "PMMA",
 "Aluminum Oxide"),        # and three materials
                                     stopping.power.ratio  = 0)
df$particle.no    <-    AT.particle.no.from.particle.name(df$particle.name)
df$material.no    <-    AT.material.no.from.material.name(df$material.name)
material.no.water <-    AT.material.no.from.material.name("Water, Liquid")
for (i in 1:nrow(df)){
    df$stopping.power.ratio[i]        <-    AT.stopping.power.ratio( E.MeV.u  
             = df$particle.energy.MeV.u[i],
                                                                    
 particle.no           = df$particle.no[i],
                                                                    
 fluence.cm2           = 1,                 
# does not have any meaning here as  monoenergetic beams are assumed
                                                                    
 material.no           = df$material.no[i],
                                                                    
 reference.material.no = material.no.water,
                                                                    
 stopping.power.source.no = 2)
}




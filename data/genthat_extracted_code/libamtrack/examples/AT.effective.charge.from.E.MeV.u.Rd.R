library(libamtrack)


### Name: AT.effective.charge.from.E.MeV.u
### Title: AT.effective.charge.from.E.MeV.u
### Aliases: AT.effective.charge.from.E.MeV.u

### ** Examples

# Charge pick-up of several nuclids depending on ion energy
df          <- data.frame( E.MeV.u          = 10^seq(-1, 2, length.out = 50),
                           particle.name    = c("1H", "3He", "6Li", "12C",
 "16O"),
                           effective.charge = 0)
for(i in 1:nrow(df)){
   df$effective.charge[i] <- AT.effective.charge.from.E.MeV.u(  E.MeV.u     =
 df$E.MeV.u[i], 
                                                                particle.no =
 AT.particle.no.from.particle.name(df$particle.name[i])[1])
}




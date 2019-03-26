library(slouch)


### Name: regimeplot.slouch
### Title: Plot the internal regimes for a given fitted model
### Aliases: regimeplot.slouch regimeplot

### ** Examples


data(artiodactyla)
data(neocortex)

neocortex <- neocortex[match(artiodactyla$tip.label, neocortex$species), ]

m0 <- slouch.fit(phy = artiodactyla,
                 species = neocortex$species,
                 response = neocortex$body_mass_g_log_mean,
                 mv.response = neocortex$body_mass_g_log_varmean,
                 fixed.fact = neocortex$diet,
                 hillclimb = TRUE)
                 
regimeplot(m0)





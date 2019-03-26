library(slouch)


### Name: plot.slouch
### Title: Plot Grid Search
### Aliases: plot.slouch

### ** Examples


data(artiodactyla)
data(neocortex)

neocortex <- neocortex[match(artiodactyla$tip.label, neocortex$species), ]

m0 <- slouch.fit(phy = artiodactyla,
                 hl_values = seq(0.001, 50, length.out = 15),
                 vy_values = seq(0.001, 3, length.out = 15),
                 species = neocortex$species,
                 response = neocortex$body_mass_g_log_mean,
                 mv.response = neocortex$body_mass_g_log_varmean,
                 fixed.fact = neocortex$diet)
                 
plot(m0)




library(slouch)


### Name: summary.slouch
### Title: Model Summary
### Aliases: summary.slouch

### ** Examples

data(artiodactyla)
data(neocortex)

neocortex <- neocortex[match(artiodactyla$tip.label, neocortex$species), ]

m0 <- slouch.fit(phy = artiodactyla,
                 hl_values = seq(0.001, 4, length.out = 10),
                 vy_values = seq(0.001, 0.05, length.out = 10),
                 species = neocortex$species,
                 response = neocortex$neocortex_area_mm2_log_mean,
                 mv.response = neocortex$neocortex_se_squared,
                 random.cov = neocortex$brain_mass_g_log_mean,
                 mv.random.cov = neocortex$brain_se_squared,
                 fixed.fact = neocortex$diet,
                 hillclimb = FALSE)
                 
summary(m0) 

plot(m0, theta = 150)




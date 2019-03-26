library(slouch)


### Name: hillclimbplot
### Title: Plot the hillclimber trajectory
### Aliases: hillclimbplot hillclimbplot.slouch

### ** Examples

library(slouch)
library(ape)

data(neocortex)
data(artiodactyla)

neocortex <- neocortex[match(artiodactyla$tip.label, neocortex$species), ]

m0 <- slouch.fit(phy = artiodactyla,
                species = neocortex$species,
                response = neocortex$neocortex_area_mm2_log_mean,
                mv.response = neocortex$neocortex_se_squared,
                hillclimb = TRUE)
                
hillclimbplot(m0)

m1 <- brown.fit(phy = artiodactyla,
               species = neocortex$species,
               response = neocortex$neocortex_area_mm2_log_mean,
               mv.response = neocortex$neocortex_se_squared,
               hillclimb = TRUE)
               
hillclimbplot(m1)




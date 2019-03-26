library(candisc)


### Name: Grass
### Title: Yields from Nitrogen nutrition of grass species
### Aliases: Grass
### Keywords: datasets

### ** Examples

str(Grass)
grass.mod <- lm(cbind(N1,N9,N27,N81,N243) ~ Block + Species, data=Grass)
Anova(grass.mod)

grass.canL <-candiscList(grass.mod)
names(grass.canL)
names(grass.canL$Species)





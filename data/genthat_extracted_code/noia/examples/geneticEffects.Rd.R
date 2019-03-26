library(noia)


### Name: Genetic effects
### Title: Genetic Effects
### Aliases: geneticEffects effectsNames
### Keywords: regression

### ** Examples

map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")

# Regressions

linear <- linearRegression(phen=pop$phen, gen=cbind(pop$Loc1, pop$Loc2))

geneticEffects(linear, "P1")




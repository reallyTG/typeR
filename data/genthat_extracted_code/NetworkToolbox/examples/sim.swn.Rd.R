library(NetworkToolbox)


### Name: sim.swn
### Title: Simulate Small-world Network
### Aliases: sim.swn

### ** Examples

#Continuous data
sim.norm <- sim.swn(25, 500, nei = 3)

#Ordinal data
sim.Likert <- sim.swn(25, 500, nei = 3, replace = TRUE, ordinal = TRUE, ordLevels = 5)

#Dichotomous data
sim.Likert <- sim.swn(25, 500, nei = 3, replace = TRUE, ordinal = TRUE, ordLevels = 2)





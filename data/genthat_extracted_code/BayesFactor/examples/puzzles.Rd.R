library(BayesFactor)


### Name: puzzles
### Title: Puzzle completion times from Hays (1994)
### Aliases: puzzles
### Keywords: datasets

### ** Examples


data(puzzles)

## classical ANOVA
## Both color and shape are significant, interaction is not
classical <- aov(RT ~ shape*color + Error(ID/(shape*color)), data=puzzles)
summary(classical)

## Bayes Factor
## Best model is main effects model, no interaction
anovaBF(RT ~ shape*color + ID, data = puzzles, whichRandom = "ID", progress=FALSE)






library(DescTools)


### Name: Datasets for Simulation
### Title: Datasets for Probabilistic Simulation
### Aliases: cards tarot roulette
### Keywords: datasets

### ** Examples

head(cards)
head(tarot)
head(roulette)

# drawing 5 cards
sample(do.call(paste, cards), 5)

# spin the wheel
sample(do.call(paste, roulette), 1)

# simulate the evening in Las Vegas
sample(do.call(paste, roulette), 32, replace=TRUE)




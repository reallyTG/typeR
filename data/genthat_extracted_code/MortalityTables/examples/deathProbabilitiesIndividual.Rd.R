library(MortalityTables)


### Name: deathProbabilitiesIndividual
### Title: Return a matrix of the persons' individual death probabilities
###   of a joint-life table (instance of 'mortalityTable.jointLives')
### Aliases: deathProbabilitiesIndividual

### ** Examples

mortalityTables.load("Germany_Census")
deathProbabilitiesIndividual(list(mort.DE.census.1924.26.male), 1977, c(0, 0))
deathProbabilitiesIndividual(list(mort.DE.census.1924.26.male), 1977, c(0, -5, 13))





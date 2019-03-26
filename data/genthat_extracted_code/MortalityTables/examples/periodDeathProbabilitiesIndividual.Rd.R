library(MortalityTables)


### Name: periodDeathProbabilitiesIndividual
### Title: Return a matrix of the persons' individual period death
###   probabilities of a joint-life table (instance of
###   'mortalityTable.jointLives')
### Aliases: periodDeathProbabilitiesIndividual

### ** Examples

mortalityTables.load("Germany_Census")
periodDeathProbabilitiesIndividual(list(mort.DE.census.1924.26.male), 1977, c(0, 0))
periodDeathProbabilitiesIndividual(list(mort.DE.census.1924.26.male), 1977, c(0, -5, 13))





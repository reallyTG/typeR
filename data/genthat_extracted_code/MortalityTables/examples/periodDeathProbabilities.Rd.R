library(MortalityTables)


### Name: periodDeathProbabilities
### Title: Return the (period) death probabilities of the life table for a
###   given observation year
### Aliases: periodDeathProbabilities
###   periodDeathProbabilities,mortalityTable.period-method
###   periodDeathProbabilities,mortalityTable.ageShift-method
###   periodDeathProbabilities,mortalityTable.trendProjection-method
###   periodDeathProbabilities,mortalityTable.improvementFactors-method
###   periodDeathProbabilities,mortalityTable.mixed-method
###   periodDeathProbabilities,mortalityTable.jointLives-method

### ** Examples

mortalityTables.load("Austria_Annuities")
periodDeathProbabilities(AVOe2005R.male, Period = 1975)
periodDeathProbabilities(AVOe2005R.male, Period = 2017)

mortalityTables.load("Germany_Census")
table.JL = mortalityTable.jointLives(
    name = "ADSt 24/26 auf verbundene Leben",
    table = mort.DE.census.1924.26.male
)
periodDeathProbabilities(table.JL, Period = 2017, ageDifferences = c(1, 5, -5, 16))
periodDeathProbabilities(table.JL, Period = 2017, ageDifferences = c(0))
periodDeathProbabilities(table.JL, Period = 2017, ageDifferences = c(1, 5, 16))





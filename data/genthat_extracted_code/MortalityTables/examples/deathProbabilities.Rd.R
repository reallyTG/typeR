library(MortalityTables)


### Name: deathProbabilities
### Title: Return the (cohort) death probabilities of the life table given
###   the birth year (if needed)
### Aliases: deathProbabilities
###   deathProbabilities,mortalityTable.period-method
###   deathProbabilities,mortalityTable.ageShift-method
###   deathProbabilities,mortalityTable.trendProjection-method
###   deathProbabilities,mortalityTable.improvementFactors-method
###   deathProbabilities,mortalityTable.mixed-method
###   deathProbabilities,mortalityTable.jointLives-method

### ** Examples

mortalityTables.load("Austria_Annuities")
deathProbabilities(AVOe2005R.male, YOB = 1975)
deathProbabilities(AVOe2005R.male, YOB = 2017)

mortalityTables.load("Germany_Census")
table.JL = mortalityTable.jointLives(
    name = "ADSt 24/26 auf verbundene Leben",
    table = mort.DE.census.1924.26.male
)
deathProbabilities(table.JL, YOB = 1977, ageDifferences = c(1, 5, -5, 16))
deathProbabilities(table.JL, YOB = 1977, ageDifferences = c(0))
deathProbabilities(table.JL, YOB = 1977, ageDifferences = c(1, 5, 16))





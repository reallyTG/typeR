library(MortalityTables)


### Name: mortalityTable.jointLives-class
### Title: Class mortalityTable.jointLives - Life table for multiple joint
###   lives
### Aliases: mortalityTable.jointLives-class mortalityTable.jointLives

### ** Examples

mortalityTables.load("Germany_Census")
table.JL = mortalityTable.jointLives(
    name = "ADSt 24/26 auf verbundene Leben",
    table = mort.DE.census.1924.26.male
)
deathProbabilities(table.JL, YOB = 1977, ageDifferences = c(1, 5, -5, 16))
deathProbabilities(table.JL, YOB = 1977, ageDifferences = c(0))
deathProbabilities(table.JL, YOB = 1977, ageDifferences = c(1, 5, 16))





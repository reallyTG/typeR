library(MortalityTables)


### Name: mortalityImprovement
### Title: Return the mortality trend (yearly log-death-probability
###   improvement) of the given period or the given generation.
### Aliases: mortalityImprovement
###   mortalityImprovement,mortalityTable-method

### ** Examples

mortalityTables.load("Austria_Annuities")
# AVOe 2005R includes a trend decline by default, compare the exact table
# with the table without decline:
mortalityImprovement(AVOe2005R.male, Period = 2017)
mortalityImprovement(AVOe2005R.male.nodamping, Period = 2017)





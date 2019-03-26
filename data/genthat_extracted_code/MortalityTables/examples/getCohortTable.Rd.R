library(MortalityTables)


### Name: getCohortTable
### Title: Return the cohort life table as a 'mortalityTable.period' object
### Aliases: getCohortTable getCohortTable,mortalityTable-method

### ** Examples

mortalityTables.load("Austria_Annuities")
tb75 = getCohortTable(AVOe2005R.male, YOB = 1975)
# The tb75 is a fixed table with no trend any more
plot(AVOe2005R.male, tb75, Period = 2017)





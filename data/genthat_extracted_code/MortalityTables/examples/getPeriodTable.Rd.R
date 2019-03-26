library(MortalityTables)


### Name: getPeriodTable
### Title: Return the period life table as a 'mortalityTable.period' object
### Aliases: getPeriodTable getPeriodTable,mortalityTable-method

### ** Examples

mortalityTables.load("Austria_Annuities")
tb17 = getPeriodTable(AVOe2005R.male, Period = 2017)
# The tb17 is a fixed table with no trend any more
plot(AVOe2005R.male, tb17, YOB = 1975)





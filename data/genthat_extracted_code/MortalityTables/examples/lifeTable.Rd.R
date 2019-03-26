library(MortalityTables)


### Name: lifeTable
### Title: Return the lifetable object (package lifecontingencies) for the
###   cohort life table
### Aliases: lifeTable lifeTable,mortalityTable-method

### ** Examples

library("lifecontingencies")
mortalityTables.load("Austria_Annuities")
lifeTable(AVOe2005R.male, YOB = 2017)
axn(lifeTable(AVOe2005R.male, YOB = 1975), x = 65, i = 0.03)
axn(lifeTable(AVOe2005R.male, YOB = 2017), x = 65, i = 0.03)





library(MortalityTables)


### Name: ageShift
### Title: Return the age shift of the age-shifted life table given the
###   birth year
### Aliases: ageShift ageShift,mortalityTable-method
###   ageShift,mortalityTable.ageShift-method

### ** Examples

mortalityTables.load("Austria_Annuities")
ageShift(AVOe2005R.male.av, YOB=1910)
ageShift(AVOe2005R.male.av, YOB=1955)
ageShift(AVOe2005R.male.av, YOB=2010)
# A table with trend does NOT have any age shift, so NA is returned:
ageShift(AVOe2005R.male, YOB=1910)





library(MortalityTables)


### Name: getOmega
### Title: Return the maximum age of the life table
### Aliases: getOmega getOmega,mortalityTable.period-method
###   getOmega,mortalityTable.mixed-method
###   getOmega,mortalityTable.jointLives-method

### ** Examples

mortalityTables.load("Austria_Annuities")
getOmega(AVOe2005R.male)
getOmega(mortalityTable.deMoivre(omega = 100))





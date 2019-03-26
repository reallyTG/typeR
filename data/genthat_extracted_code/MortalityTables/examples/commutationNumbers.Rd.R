library(MortalityTables)


### Name: commutationNumbers
### Title: Calculate the commutation numbers for the given parameters,
###   using the mortality table and an interest rate
### Aliases: commutationNumbers commutationNumbers,mortalityTable-method
###   commutationNumbers,numeric-method
###   commutationNumbers,pensionTable-method

### ** Examples

mortalityTables.load("Austria_Annuities")
commutationNumbers(AVOe2005R.male, i = 0.03, YOB = 1975)





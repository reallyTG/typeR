library(MortalityTables)


### Name: mortalityTable.MakehamGompertz-class
### Title: Class mortalityTable.MakehamGompertz - Mortality table with
###   Makeham-Gompertz's law
### Aliases: mortalityTable.MakehamGompertz-class
###   mortalityTable.MakehamGompertz

### ** Examples

# A Gompertz mortality, roughtly approximating the Austrian annuitants 2017
gmp = mortalityTable.MakehamGompertz(A = 0, B = 0.00001, c = 1.11)
mortalityTables.load("Austria_Annuities_AVOe2005R")
plot(gmp, AVOe2005R.male, Period=2017)

# A Makeham-Gompertz mortality, approximating the Austrian annuitants 2017
mg = mortalityTable.MakehamGompertz(A = 0.0002, B = 0.00001, c = 1.11)
plot(mg, gmp, AVOe2005R.male, Period=2017)





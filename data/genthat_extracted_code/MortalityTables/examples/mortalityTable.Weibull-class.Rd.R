library(MortalityTables)


### Name: mortalityTable.Weibull-class
### Title: Class mortalityTable.Weibull - Mortality table with Weibull's
###   law
### Aliases: mortalityTable.Weibull-class mortalityTable.Weibull

### ** Examples

# A Weibull mortality
wbl = mortalityTable.Weibull(k = 0.0000000001, n = 4.8)
mortalityTables.load("Austria_Annuities_AVOe2005R")
plot(wbl, AVOe2005R.male, Period=2017, ylim = c(0.00005, 1))





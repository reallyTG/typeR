library(vamc)


### Name: calcMortFactors
### Title: Calculates the mortality factors (t - 1)px q(x + t - 1) and tpx
###   required to valuate the inPolicy. Extract gender, age (birth date &
###   current date), valuation date (current date), and maturity date from
###   inPolicy, mortality rates from mortTable.
### Aliases: calcMortFactors

### ** Examples

exPolicy <- VAPort[1, ]
calcMortFactors(exPolicy, mortTable, dT = 1 / 12)




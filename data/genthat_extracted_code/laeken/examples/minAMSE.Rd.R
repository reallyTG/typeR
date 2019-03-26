library(laeken)


### Name: minAMSE
### Title: Weighted asymptotic mean squared error (AMSE) estimator
### Aliases: minAMSE print.minAMSE
### Keywords: manip

### ** Examples

data(eusilc)
# equivalized disposable income is equal for each household
# member, therefore only one household member is taken
minAMSE(eusilc$eqIncome[!duplicated(eusilc$db030)],
    kmin = 50, kmax = 150, mmax = 250)




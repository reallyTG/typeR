library(vamc)


### Name: agePortfolio
### Title: Age a portfolio of VA policies specified in each inPolicy of
###   inPortfolio from currentDate (specified in inPolicy) to targetDate.
###   The againg scenario is given in fundScen. The time step length is
###   specified in dT. Here we input a rather irrelevant parameter df to
###   "hack" for a more flexible user-defined projection function.
### Aliases: agePortfolio

### ** Examples

targetDate <- "2016-01-01"
histFundScen <- genFundScen(fundMap, histIdxScen)
agePortfolio(VAPort[1:2, ], mortTable, histFundScen, histDates, dT = 1 / 12,
targetDate, cForwardCurve)
## Not run: 
##D targetDate <- "2001-01-01"
##D histFundScen <- genFundScen(fundMap, histIdxScen)
##D agePortfolio(VAPort, mortTable, histFundScen, histDates, dT = 1 / 12,
##D targetDate, cForwardCurve)
## End(Not run)
## Not run: 
##D VAPort[1, c("currentDate", "issueDate")] <- c("2001-01-01", "2001-01-01")
##D histFundScen <- genFundScen(fundMap, histIdxScen)
##D agePortfolio(VAPort, mortTable, histFundScen, histDates, dT = 1 / 12,
##D targetDate, cForwardCurve)
## End(Not run)




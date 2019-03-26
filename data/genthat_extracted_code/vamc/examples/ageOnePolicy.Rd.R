library(vamc)


### Name: ageOnePolicy
### Title: Age a VA policy specified in inPolicy from currentDate
###   (specified in inPolicy) to targetDate. The againg scenario is given
###   in fundScen. The time step length is specified in dT. Here we input a
###   rather irrelevant parameter df to "hack" for a more flexible
###   user-defined projection function.
### Aliases: ageOnePolicy

### ** Examples

exPolicy <- VAPort[1, ]
targetDate <- "2016-01-01"
histFundScen <- genFundScen(fundMap, histIdxScen)
ageOnePolicy(exPolicy, mortTable, histFundScen, histDates, dT = 1 / 12,
targetDate, cForwardCurve)
## Not run: 
##D targetDate <- "2001-01-01"
##D histFundScen <- genFundScen(fundMap, histIdxScen)
##D ageOnePolicy(exPolicy, mortTable, histFundScen, histDates, dT = 1 / 12,
##D targetDate, cForwardCurve)
## End(Not run)
## Not run: 
##D exPolicy <- VAPort[1, ]
##D exPolicy[1, c("currentDate", "issueDate")] <- c("2001-01-01", "2001-01-01")
##D histFundScen <- genFundScen(fundMap, histIdxScen)
##D ageOnePolicy(exPolicy, mortTable, histFundScen, histDates, dT = 1 / 12,
##D targetDate, cForwardCurve)
## End(Not run)




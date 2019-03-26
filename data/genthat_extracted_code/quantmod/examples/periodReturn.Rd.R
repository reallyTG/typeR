library(quantmod)


### Name: periodReturn
### Title: Calculate Periodic Returns
### Aliases: periodReturn allReturns dailyReturn weeklyReturn monthlyReturn
###   quarterlyReturn yearlyReturn annualReturn
### Keywords: utilities

### ** Examples

## Not run: 
##D getSymbols('QQQQ',src='yahoo')
##D allReturns(QQQQ)  # returns all periods
##D 
##D periodReturn(QQQQ,period='yearly',subset='2003::')  # returns years 2003 to present
##D periodReturn(QQQQ,period='yearly',subset='2003')  # returns year 2003
##D 
##D rm(QQQQ)
## End(Not run)




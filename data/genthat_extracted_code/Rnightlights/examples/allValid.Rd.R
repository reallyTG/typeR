library(Rnightlights)


### Name: allValid
### Title: Check if a vector/list of values given is valid as per the given
###   validation function
### Aliases: allValid

### ** Examples


## No test: 
Rnightlights:::allValid(c("KEZ", "UGA", "RWA", "TZA"), Rnightlights:::validCtryCodes)
## End(No test)
 
## No test: 
Rnightlights:::allValid(c("2012", "2015"), validNlPeriods, "OLS.Y")
## End(No test)





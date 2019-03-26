library(Rnightlights)


### Name: getAllNlPeriods
### Title: Generate a list of all possible nlPeriods for a given nlType
### Aliases: getAllNlPeriods

### ** Examples

getAllNlPeriods("OLS.Y")
 #returns a vector of all years from 1994 to 2013

getAllNlPeriods("VIIRS.M")
 #returns a vector of all yearMonths from 201401 to present

getAllNlPeriods(c("OLS.Y", "VIIRS.Y"))
 #returns a list with 2 named vectors, one for each annual nlType




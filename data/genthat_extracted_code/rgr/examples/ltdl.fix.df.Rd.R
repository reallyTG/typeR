library(rgr)


### Name: ltdl.fix.df
### Title: Replace Negative Values Representing Less Than Detects in a Data
###   Frame
### Aliases: ltdl.fix.df
### Keywords: misc

### ** Examples

## Replace any missing data coded as -9999 with NAs and any remaining
## negative values representing less than detects with Abs(value)/2
data(fix.test)
fix.test
fix.test.fixed <- ltdl.fix.df(fix.test, coded = -9999)
fix.test.fixed

## As above, and replace any zero values with NAs
fix.test.fixed <- ltdl.fix.df(fix.test, coded = -9999, zero2na = TRUE)
fix.test.fixed

## As above, but replace any negative values with NAs
fix.test.fixed <- ltdl.fix.df(fix.test, negs2na = TRUE, coded = -9999, zero2na = TRUE)
fix.test.fixed

## Clean-up
rm(fix.test.fixed)




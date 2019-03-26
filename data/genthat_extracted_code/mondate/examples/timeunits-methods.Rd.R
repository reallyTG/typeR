library(mondate)


### Name: timeunits-methods
### Title: Methods to Access 'timeunits' Property
### Aliases: timeunits-methods timeunits,mondate-method
###   timeunits,ANY-method timeunits timeunits<--methods
###   timeunits<-,mondate-method timeunits<-
### Keywords: methods

### ** Examples

x <- mondate("2010-6-30") # The middle of 2010
timeunits(x)              # "months"
y <- x + 12               # One year (12 months) later.
timeunits(y)              # "months"
y - x                     # Result is 12 months
timeunits(y) <- "years"
y - x                     # Result is 1 year, with a warning because 
                          # x@timeunits != y@timeunits. Units of result
                          # comes from the first argument.
timeunits(y) <- "days"
suppressWarnings(y - x)   # Result is 365 days -- warning suppressed




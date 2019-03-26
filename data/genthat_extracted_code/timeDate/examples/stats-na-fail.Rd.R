library(timeDate)


### Name: is.na-methods
### Title: is.na Methods
### Aliases: is.na-methods is.na,timeDate-method
### Keywords: chron

### ** Examples

# Create a timeCalendar sequence
(td <- timeCalendar())
is.na(td)

# insert NA's
is.na(td) <- 2:3
td

# test of NA's
is.na(td)




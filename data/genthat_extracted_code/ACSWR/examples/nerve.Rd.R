library(ACSWR)


### Name: nerve
### Title: The Nerve Data
### Aliases: nerve
### Keywords: empirical distribution function

### ** Examples

data(nerve)
nerve_ecdf <- ecdf(nerve)
knots(nerve_ecdf) # Returns the jump points of the edf
summary(nerve_ecdf) # the usual R summaries
nerve_ecdf(nerve) # returns the percentiles at the data points




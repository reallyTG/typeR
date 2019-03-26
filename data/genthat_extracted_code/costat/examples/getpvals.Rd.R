library(costat)


### Name: getpvals
### Title: Form a particular linear combination of two time series and
###   assess the combination's stationarity p-value
### Aliases: getpvals
### Keywords: ts

### ** Examples

#
# Generate two toy time series data sets
#
x1 <- rnorm(32)
y1 <- rnorm(32)
#
# Generate two toy sets of parameters (for combination)
#
tmp.a <- c(1,-1)
tmp.b <- c(0.5, 0.5)
#
# Call the function and find out the degree of stationarity of this
# combination
#
## Not run: 
##D ans <- getpvals(c(tmp.a, tmp.b), prodcomb.fn=prodcomb, tsx=x1, tsy=y1,
##D         filter.number=1, family="DaubExPhase")
## End(Not run)
#
# What is the p-value?
#
## Not run: ans
# [1] 0.53




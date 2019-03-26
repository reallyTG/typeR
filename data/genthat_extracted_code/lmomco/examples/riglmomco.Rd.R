library(lmomco)


### Name: riglmomco
### Title: Income Gap Ratio Quantile Function for the Distributions
### Aliases: riglmomco
### Keywords: quantile function income gap ratio quantile function
###   lifetime/reliability analysis The lmomco functions

### ** Examples

# Let us parametize some "income" distribution.
A <- vec2par(c(123, 264, 2.11), type="gov")
riglmomco(0.5, A)
## Not run: 
##D F <- nonexceeds(f01=TRUE)
##D plot(F, riglmomco(F,A), type="l",
##D      xlab="NONEXCEEDANCE PROBABILITY", ylab="INCOME GAP RATIO")
## End(Not run)




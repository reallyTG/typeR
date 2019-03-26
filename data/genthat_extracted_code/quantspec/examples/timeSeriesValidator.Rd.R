library(quantspec)


### Name: timeSeriesValidator
### Title: Validates if 'Y' is of an appropriate type and converts to a
###   numeric.
### Aliases: timeSeriesValidator
### Keywords: Validator-functions

### ** Examples

Y <- timeSeriesValidator(sp500)
Y <- timeSeriesValidator(wheatprices)
Y <- timeSeriesValidator(rnorm(10))
## Not run: Y <- timeSeriesValidator("Not a valid input")




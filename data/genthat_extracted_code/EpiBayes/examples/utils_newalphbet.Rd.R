library(EpiBayes)


### Name: utils_newalphbet
### Title: Computes Beta Parameters given a Mean and Variance
### Aliases: utils_newalphbet

### ** Examples

## Say we have that the tau posterior distribution from EpiBayes_ns() has mean and
## variance 0.01, and 0.015, respectively. The corresponding beta parameters will be:
utils_newalphbet(0.01, 0.015)

## If we provide a mean of 1, gives meaningful results
utils_newalphbet(1, 1)

## If we provide a mean of 0, gives meaningful results
utils_newalphbet(0, 1)

## Not run: 
##D ## Returns an error message if shape parameters cannot be coerced to be positive
##D utils_newalphbet(1, -1)
## End(Not run)




library(approximator)


### Name: is.consistent
### Title: Checks observational data for consistency with a subsets object
### Aliases: is.consistent
### Keywords: array

### ** Examples

data(toyapps)
stopifnot(is.consistent(subsets.toy,z.toy))

z.toy[[4]] <- 1:6
is.consistent(subsets.toy,z.toy)




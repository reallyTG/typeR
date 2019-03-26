library(Runuran)


### Name: unuran.details
### Title: Information on a given "unuran" generator object
### Aliases: unuran.details
### Keywords: distribution datagen

### ** Examples

## Create a generator object
distr <- udnorm()
gen <- tdrd.new(distr)

## print data about object on console
unuran.details(gen)

## get list with some of these data
data <- unuran.details(gen,return.list=TRUE)





library(Luminescence)


### Name: calc_CommonDose
### Title: Apply the (un-)logged common age model after Galbraith et al.
###   (1999) to a given De distribution
### Aliases: calc_CommonDose

### ** Examples


## load example data
data(ExampleData.DeValues, envir = environment())

## apply the common dose model
calc_CommonDose(ExampleData.DeValues$CA1)





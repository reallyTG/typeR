library(Luminescence)


### Name: calc_CentralDose
### Title: Apply the central age model (CAM) after Galbraith et al. (1999)
###   to a given De distribution
### Aliases: calc_CentralDose

### ** Examples


##load example data
data(ExampleData.DeValues, envir = environment())

##apply the central dose model
calc_CentralDose(ExampleData.DeValues$CA1)





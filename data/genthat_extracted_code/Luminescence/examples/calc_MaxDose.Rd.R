library(Luminescence)


### Name: calc_MaxDose
### Title: Apply the maximum age model to a given De distribution
### Aliases: calc_MaxDose

### ** Examples


## load example data
data(ExampleData.DeValues, envir = environment())

# apply the maximum dose model
calc_MaxDose(ExampleData.DeValues$CA1, sigmab = 0.2, par = 3)





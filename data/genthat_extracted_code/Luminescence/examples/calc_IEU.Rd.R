library(Luminescence)


### Name: calc_IEU
### Title: Apply the internal-external-uncertainty (IEU) model after
###   Thomsen et al. (2007) to a given De distribution
### Aliases: calc_IEU

### ** Examples


## load data
data(ExampleData.DeValues, envir = environment())

## apply the IEU model
ieu <- calc_IEU(ExampleData.DeValues$CA1, a = 0.2, b = 1.9, interval = 1)





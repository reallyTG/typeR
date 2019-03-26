library(Luminescence)


### Name: plot_RLum.Results
### Title: Plot function for an RLum.Results S4 class object
### Aliases: plot_RLum.Results
### Keywords: aplot

### ** Examples



###load data
data(ExampleData.DeValues, envir = environment())

# apply the un-logged minimum age model
mam <- calc_MinDose(data = ExampleData.DeValues$CA1, sigmab = 0.2, log = TRUE, plot = FALSE)

##plot
plot_RLum.Results(mam)

# estimate the number of grains on an aliquot
grains<- calc_AliquotSize(grain.size = c(100,150), sample.diameter = 1, plot = FALSE, MC.iter = 100)

##plot
plot_RLum.Results(grains)






library(Luminescence)


### Name: plot_RLum.Data.Curve
### Title: Plot function for an RLum.Data.Curve S4 class object
### Aliases: plot_RLum.Data.Curve
### Keywords: aplot

### ** Examples


##plot curve data

#load Example data
data(ExampleData.CW_OSL_Curve, envir = environment())

#transform data.frame to RLum.Data.Curve object
temp <- as(ExampleData.CW_OSL_Curve, "RLum.Data.Curve")

#plot RLum.Data.Curve object
plot_RLum.Data.Curve(temp)






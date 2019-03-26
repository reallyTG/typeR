library(Luminescence)


### Name: plot_RLum
### Title: General plot function for RLum S4 class objects
### Aliases: plot_RLum
### Keywords: dplot

### ** Examples


#load Example data
data(ExampleData.CW_OSL_Curve, envir = environment())

#transform data.frame to RLum.Data.Curve object
temp <- as(ExampleData.CW_OSL_Curve, "RLum.Data.Curve")

#plot RLum object
plot_RLum(temp)






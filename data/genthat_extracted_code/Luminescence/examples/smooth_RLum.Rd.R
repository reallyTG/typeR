library(Luminescence)


### Name: smooth_RLum
### Title: Smoothing of data
### Aliases: smooth_RLum smooth_RLum,list-method
### Keywords: utilities

### ** Examples


##load example data
data(ExampleData.CW_OSL_Curve, envir = environment())

##create RLum.Data.Curve object from this example
curve <-
  set_RLum(
      class = "RLum.Data.Curve",
      recordType = "OSL",
      data = as.matrix(ExampleData.CW_OSL_Curve)
  )

##plot data without and with smoothing
plot_RLum(curve)
plot_RLum(smooth_RLum(curve))





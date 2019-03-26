library(ContourFunctions)


### Name: cf_data
### Title: Makes filled contour plot from data without sidebar by
###   interpolating with Gaussian process, passes model to cf_func to make
###   contour
### Aliases: cf_data

### ** Examples

x <- runif(20)
y <- runif(20)
z <- exp(-(x-.5)^2-5*(y-.5)^2)
cf_data(x,y,z)




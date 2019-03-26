library(ContourFunctions)


### Name: cf_func
### Title: Makes filled contour plot from function without sidebar, uses
###   cf_grid
### Aliases: cf_func

### ** Examples

cf_func(function(x){x[1]*x[2]})
cf_func(function(x)(exp(-(x[1]-.5)^2-5*(x[2]-.5)^2)))
cf_func(function(xx){exp(-sum((xx-.5)^2/.1))}, bar=TRUE)
cf_func(function(xx){exp(-sum((xx-.5)^2/.1))}, bar=TRUE, mainminmax=TRUE)




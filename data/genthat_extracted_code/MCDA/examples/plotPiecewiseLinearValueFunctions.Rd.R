library(MCDA)


### Name: plotPiecewiseLinearValueFunctions
### Title: Function to plot piecewise linear value functions.
### Aliases: plotPiecewiseLinearValueFunctions
### Keywords: methods

### ** Examples


v<-list(
  Price = array(c(30, 0, 16, 0, 2, 0.0875), 
    dim=c(2,3), dimnames = list(c("x", "y"), NULL)), 
  Time = array(c(40, 0, 30, 0, 20, 0.025, 10, 0.9), 
    dim = c(2, 4), dimnames = list(c("x", "y"), NULL)), 
  Comfort = array(c(0, 0, 1, 0, 2, 0.0125, 3, 0.0125), 
    dim = c(2, 4), dimnames = list(c("x", "y"), NULL)))

# plot the value functions

plotPiecewiseLinearValueFunctions(v)




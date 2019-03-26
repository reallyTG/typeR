library(pointRes)


### Name: event.plot
### Title: Plot event years for individual trees
### Aliases: event.plot

### ** Examples

## Plot event years from pointer.rgc output
data(s033)
py <- pointer.rgc(s033)
event.plot(py, start.yr = 1950, end.yr = NULL) 

## Plot negative event years from pointer.norm output (method "Neuwirth")
data(s033)
py_n <- pointer.norm(s033, window = 5, method.thresh = "Neuwirth")
event.plot(py_n, sign = "neg", start.yr = 1950, end.yr = NULL) 
           




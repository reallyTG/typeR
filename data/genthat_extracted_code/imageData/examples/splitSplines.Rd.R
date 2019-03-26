library(imageData)


### Name: splitSplines
### Title: Adds the fits after fitting a natural cubic smoothing spline to
###   subsets of a response to a 'data.frame'
### Aliases: splitSplines
### Keywords: data manip

### ** Examples

data(exampleData)
longi.dat <- splitSplines(longi.dat, response="Area", x="xDays", 
                          INDICES = "Snapshot.ID.Tag", 
                          df = 4, deriv=1, suffices.deriv="AGRdv", RGR="RGRdv")




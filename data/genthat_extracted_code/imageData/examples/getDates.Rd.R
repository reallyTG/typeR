library(imageData)


### Name: getDates
### Title: Forms a subset of 'responses' in 'data' that contains their
###   values for the nominated times
### Aliases: getDates
### Keywords: data manip

### ** Examples

data(exampleData)
AreaLast <- getDates("Area.smooth", data = longi.dat, 
                     which.times = c(42), suffix = "last")




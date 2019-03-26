library(imageData)


### Name: intervalValueCalculate
### Title: Calculates a single value that is a function of an individual's
###   values for a response over a specified time interval
### Aliases: intervalValueCalculate
### Keywords: data manip

### ** Examples

data(exampleData)
Area.smooth.max <- intervalValueCalculate("Area.smooth", 
                                          start.time = 31, end.time = 35, 
                                          suffix.interval = "31to35",
                                          data = longi.dat)




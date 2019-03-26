library(imageData)


### Name: intervalGRaverage
### Title: Calculates the growth rates for a specified time interval by
###   taking weighted averages of growth rates for times within the
###   interval
### Aliases: intervalGRaverage
### Keywords: data manip

### ** Examples

data(exampleData)
longi.dat <- splitSplines(longi.dat, response="Area", x="xDays", 
                          INDICES = "Snapshot.ID.Tag", 
                          df = 4, deriv=1, suffices.deriv="AGRdv", RGR="RGRdv")
Area.smooth.GR <- intervalGRaverage("Area.smooth", which.rates = c("AGR","RGR"), 
                                    suffices.rates = c("AGRdv","RGRdv"), 
                                    start.time = 31, end.time = 35, 
                                    suffix.interval = "31to35",
                                    data = longi.dat)




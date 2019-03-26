library(imageData)


### Name: intervalGRdiff
### Title: Calculates the growth rates for a specified time interval
### Aliases: intervalGRdiff
### Keywords: data manip

### ** Examples

data(exampleData)
Area.smooth.GR <- intervalGRdiff("Area.smooth", which.rates = c("AGR","RGR"), 
                                 start.times = 31, end.times = 35,
                                 suffix.interval = "31to35",
                                 data = longi.dat)




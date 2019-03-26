library(imageData)


### Name: intervalWUI
### Title: Calculates water use indices (WUI) over a specified time
###   interval to a data.frame
### Aliases: intervalWUI
### Keywords: data manip

### ** Examples

data(exampleData)
Area.smooth.WUI <- intervalWUI("Area", water.use = "Water.Loss", 
                               start.times = 31, end.times = 35, 
                               suffix = "31to35", 
                               data = longi.dat, include.total.water = TRUE)




library(imageData)


### Name: imagetimesPlot
### Title: Plots the position of a time within an interval against the
###   interval for each cart
### Aliases: imagetimesPlot
### Keywords: hplot

### ** Examples

data(exampleData)
library(ggplot2)
longi.dat <- calcTimes(longi.dat, imageTimes = "Snapshot.Time.Stamp",
                       timePositions = "Hour")
imagetimesPlot(data = longi.dat, intervals = "Days", timePositions = "Hour",
               ggplotFuncs=list(scale_colour_gradient(low="grey20", high="black"), 
                                geom_line(aes(group=Snapshot.ID.Tag, colour=Lane))))





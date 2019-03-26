library(imageData)


### Name: anomPlot
### Title: Identifies anomalous individuals and produces longitudinal plots
###   without them and with just them
### Aliases: anomPlot
### Keywords: hplot

### ** Examples

data(exampleData)
anomalous <- anomPlot(longi.dat, response="Area.smooth.AGR", 
                      lower=2.5, start.time=40, 
                      x = "xDays+35.42857143", vertical.line=29, 
                      breaks=seq(28, 42, by=2), 
                      whichPrint=c("innerPlot"), 
                      y.title="Area.smooth.AGR")




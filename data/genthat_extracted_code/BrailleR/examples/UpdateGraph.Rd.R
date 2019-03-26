library(BrailleR)


### Name: UpdateGraph
### Title: extract or alter graph parameters
### Aliases: UpdateGraph main update.fittedlineplot update.scatterplot
###   update.tsplot xlab ylab

### ** Examples

attach(airquality)
op = par(mfcol=c(3,2))
test1 = TimeSeriesPlot(Wind, col=4)
xlab(test1, "Day")
# check the change is permanent by doing another change
test1 

test2 = TimeSeriesPlot(Ozone)
# using the update method
update(test2, main="important title", sub="subtitles aren't always present", ylab="Ozone (ppb)") 
# finally, change the graph to use different plotting characters/line types
update(test2) # to fix
par(op)
detach(airquality)
rm(test1); rm(test2); rm(op)




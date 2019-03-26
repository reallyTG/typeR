library(pems.utils)


### Name: 3.3.pems.plots
### Title: Various plots for pems.utils
### Aliases: 3.3.pems.plots pems.plots latticePlot panel.PEMSXYPlot XYZPlot
###   pemsPlot panel.pemsPlot preprocess.pemsPlot pemsXYZCondUnitsHandler
###   WatsonPlot preprocess.WatsonPlot panel.WatsonBinPlot
###   panel.WatsonContourPlot panel.WatsonSmoothContourPlot fortify.pems
###   fortify
### Keywords: methods

### ** Examples


###########
##example 1
###########

## Not run: 
##D #plotting pems with other packages
##D 
##D #base 
##D plot(pems.1)
##D plot(pems.1$velocity)
##D 
##D #lattice 
##D xyplot(velocity~local.time, data = pems.1, type = "l")
##D 
##D #in ggplot2
##D 
##D #Note: Suggests only so you need to load this...
##D #Note: this uses fortify.pems
##D 
##D require(ggplot2)
##D qplot(time.stamp, velocity, data=pems.1)
##D ggplot(pems.1, aes(x = time.stamp, y = velocity)) + geom_line() 
##D #etc
##D 
## End(Not run)

###########
##example 2 
###########

#basic usage of latticePlot

latticePlot(velocity~local.time, data = pems.1, type = "l")

latticePlot(velocity~local.time, data = pems.1, col = "red", 
            pch = 20, panel = panel.PEMSXYPlot, 
            grid = list(col ="black", lty=2))

###########
##example 3 
###########

#basic usage of XYZPlot

a <- calcAccel(velocity, local.time, data = pems.1, output="pems")

XYZPlot(~accel*velocity, data=a)

XYZPlot(~accel*velocity, data=a, plot = wireframe, shade=TRUE)


###########
##example 4 
###########

#basic usage of pemsPlot

pemsPlot(local.time, velocity, data=pems.1, type="l")


###########
##example 5 
###########

#basic usage of WatsonPlot

#Note: using 'a' generated in example 3 
WatsonPlot(velocity, accel, data=a)

## Not run: 
##D #omit.stopped for different handling of idling data
##D WatsonPlot(velocity, accel, data=a, omit.stopped="points")
##D WatsonPlot(velocity, accel, data=a, omit.stopped="cells")
##D 
##D #plot.type for different plot methods
##D WatsonPlot(velocity, accel, data=a, plot.type=1)
##D WatsonPlot(velocity, accel, data=a, plot.type=2)
##D WatsonPlot(velocity, accel, data=a, plot.type=3)
##D WatsonPlot(velocity, accel, data=a, plot.type=4)
## End(Not run)





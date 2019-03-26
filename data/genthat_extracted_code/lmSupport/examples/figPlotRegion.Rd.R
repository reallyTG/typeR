library(lmSupport)


### Name: figPlotRegion
### Title: Sets up a plot region for later plotting
### Aliases: figPlotRegion
### Keywords: graphic

### ** Examples

figNewDevice()
figPlotRegion(x=c(0,5), y=c(0,10))
figLines(c(0,10),c(0,10))
figAxis(side=1,lab.text='X-axis 1', scale.at=seq(from=0,to=10,by=2))
figAxis(side=2,lab.text='Startle Response', scale.at=seq(from=0,to=10,by=2))




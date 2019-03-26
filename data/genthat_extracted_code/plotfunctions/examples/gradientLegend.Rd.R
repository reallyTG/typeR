library(plotfunctions)


### Name: gradientLegend
### Title: Add a gradient legend to a plot.
### Aliases: gradientLegend

### ** Examples

# empty plot:
emptyPlot(1,1, main="Test plot")
gradientLegend(valRange=c(-14,14),pos=.5, side=3)

# This produces a warning, as there is no space for labels here:
## Not run: 
##D gradientLegend(valRange=c(-14,14),pos=.125, side=4, inside=FALSE)
## End(Not run)
# Following options to fix this:
## a. put labels on other side of legend -
## not a good option, as the labels will overlap with the plot
gradientLegend(valRange=c(-14,14),pos=.125, side=4, inside=FALSE, pos.num=2)
## b. put the legend in the plot region
emptyPlot(1,1, main="Test plot")
gradientLegend(valRange=c(-14,14),pos=.125, side=4, inside=TRUE)
## c. Increase the margins:
oldmar = par()$mar
par(mar=oldmar+c(0,0,0,1))
emptyPlot(1,1, main="Test plot")
gradientLegend(valRange=c(-14,14),pos=.125, side=4, inside=FALSE)
par(mar=oldmar)
## d. the last option is not a fix, but avoid warnings: 
## set fit.margin to FALSE
emptyPlot(1,1, main="Test plot")
gradientLegend(valRange=c(-14,14),pos=.125, side=4, inside=FALSE, fit.margin=FALSE)

# change border color (and font color too!)
gradientLegend(valRange=c(-14,14),pos=.75, length=.5,
color=alphaPalette('white', f.seq=seq(0,1, by=.1)), border.col=alpha('gray'))

# when defining custom points, it is still important to specify side:

gradientLegend(valRange=c(-14,14), pos=c(.5,.25,.7,-.05), coords=TRUE, 
border.col='red', side=1)






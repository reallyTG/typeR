library(prepplot)


### Name: prepplot
### Title: Functions to prepare a figure region for base graphics
### Aliases: prepplot stripes
### Keywords: hplot aplot

### ** Examples

## default
prepplot(0:10, -5:5)
prepplot(0:10, -5:5, xaxs="i", yaxs="i")
## with stripes and grid based on default tick positions
prepplot(0:10, -5:5, stripesy=TRUE, gridx=TRUE)

## with white background, 
## axis lines and small ticks,
## major and minor grid for y,
## and plot area defined by axis limits 
##    instead of default usr coordinates
## (border is drawn because of lwd.axis)
## mgpx moves tick position labels closer to axes
prepplot(0:10, -5:5, bg="white", xaxs="i", yaxs="i",
    lwd.axis = 1, 
    gridy=c(-5,0,5), gridyminor=4, 
    tcl=-0.2, mgpx=c(3,0.5,0))

## without axis lines but with default background
## looks better with bg.area="lim"
## unless actual data points extend to the limits
prepplot(0:10, -5:5, yticks=seq(-5,5,5), 
         gridy=-5:5, gridx=TRUE,
         xaxs="i", yaxs="i")
         
## with axis arrows
## narrower margins
## small tick marks
## tick annotations close to axis
par(mar=c(3,3,2,1), mgp=c(2,0.35,0))
prepplot(0:10, -5:5, yticks=seq(-5,5,5), 
         gridy=-5:5, gridx=TRUE, lwd.axis=1, tcl=-0.2,
         border="grey92", axis.arrow=TRUE)
dev.off()  ## eliminates modified par settings

## xaxs and yaxs set in par
## labeling subsequently or in prepplot
## mgp or mgpx used for moving labeling closer to axis
par(mfrow=c(1,2), xaxs="i", yaxs="i")
  ## adding labeling subsequently
  par(mgp=c(2.25,0.75,0))
  prepplot(0:10, -5:5, yticks=seq(-5,5,5), 
           gridy=-5:5, gridx=TRUE)
  title(xlab="x axis label", ylab="y axis label", 
  sub="Labeling added subsequently", main="mgp set in par")
  ## adding labeling subsequently
  par(mgp=c(3,1,0)) # back to default
  ## adding labeling within the function
  prepplot(0:10, -5:5, yticks=seq(-5,5,5), 
           gridy=-5:5, gridx=TRUE,
           xlab="x axis label", ylab="y axis label", 
           mgpx=c(2.25,0.75,0), 
           main="mgpx set in prepplot",
           sub="Labeling added within prepplot")
  ## the difference: sub reacts to mgp, not to mgpx
dev.off()   ## eliminates modified par settings

## further examples in the pdf vignette
## access with vignette("prepplotOverview")




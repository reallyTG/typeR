library(plotfunctions)


### Name: getCoords
### Title: Convert proportions into coordinates of the plot or figure
###   region.
### Aliases: getCoords

### ** Examples

# set larger plot window, depending on your system:
# dev.new(,with=8, height=4) # windows, mac
# quartz(,8,4)               # Mac
# x11(width=8, height=4)     # linux
par(mfrow=c(1,2))

# PLOT 1: y-range is -1 to 1
emptyPlot(c(0,1),c(-1,1), h0=0, v0=0.5)
# calculate the x-coordinates for points at proportion
# -0.2, 0, .25, .5, 1.0, and 1.1 of the plot window:
p1 <- getCoords(pos=c(-0.2,0,.25,.5,1,1.1), side=2)
# use xpd=TRUE to plot outside plot region:
points(rep(0.5,length(p1)), p1, pch=16, xpd=TRUE)
# add legend outside plot region, in upper-right corner of figure:
legend(x=getCoords(1,side=1, input='f'), y=getCoords(1, side=2, input='f'),
    xjust=1, yjust=1,
    legend=c("points"), pch=16, xpd=TRUE)
# Note: this can easier be achieved with function getFigCoords

# PLOT 2: y-range is 25 to 37
# we would like to plot the points and legend at same positions
emptyPlot(c(0,1),c(25,37), h0=0, v0=0.5)
p1 <- getCoords(pos=c(-0.2,0,.25,.5,1,1.1), side=2)
points(rep(0.5,length(p1)), p1, pch=16, xpd=TRUE)
# add legend outside plot region, in upper-left corner of figure:
legend(x=getCoords(0,side=1, input='f'), y=getCoords(1, side=2, input='f'),
    xjust=0, yjust=1,
    legend=c("points"), pch=16, xpd=TRUE)





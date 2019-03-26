library(plotfunctions)


### Name: marginDensityPlot
### Title: Plot density of distribution in margins of the plot.
### Aliases: marginDensityPlot

### ** Examples

# density of a random sample from normal distribution:
val1 <- qnorm(ppoints(500))
val2 <- qt(ppoints(500), df = 2)
dens1 <- density(val1)
dens2 <- density(val2)

# setup plot window:
par(mfrow=c(1,1), cex=1.1)

# increase margin
oldmar <- par()$mar 
par(mar=oldmar + c(0,0,0,4))

# plot qqnorm
qqnorm(val2, main='t distribution',
       pch="*", col='steelblue',
       xlim=c(-3,3),
       bty='n')
qqline(val1)
abline(h=0, col=alpha('gray'))
abline(v=0, col=alpha('gray'))

# filled distribution in right margin:
marginDensityPlot(dens2, side=4, allDensities=list(dens1, dens2),
	col='steelblue',lwd=2)
# add lines:
marginDensityPlot(dens2, side=4, allDensities=list(dens1, dens2),
	col='steelblue',density=25, lwd=2)
# compare to normal:
marginDensityPlot(dens1, side=4, allDensities=list(dens1, dens2), 
	col=NA, border=1)
# Other sides are also possible:
marginDensityPlot(dens1, side=3, allDensities=list(dens1, dens2), 
	col=NA, border=alpha(1), lwd=2)
marginDensityPlot(dens2, side=3, allDensities=list(dens1, dens2), 
	col=NA, border=alpha('steelblue'), lwd=3)
# adjust the starting point with argument 'from' to bottom of plot:
marginDensityPlot(dens1, side=3, 
	from=getCoords(0, side=2), lwd=2)
marginDensityPlot(dens2, side=3, 
	col='steelblue', from=getCoords(0, side=2), lwd=2,
 maxDensityValue=2*max(dens2$y))

legend(getFigCoords('p')[2], getFigCoords('p')[3],
	yjust=0,
	legend=c("t distribution", "Gaussian"),
	fill=c("steelblue", 'black'),
	cex=.75,
	xpd=TRUE, bty='n')






library(bReeze)


### Name: energy
### Title: Calculation of total wind energy content
### Aliases: energy en plot.energy
### Keywords: methods

### ** Examples

## Not run: 
##D ## load and prepare data
##D data("winddata", package="bReeze")
##D set1 <- set(height=40, v.avg=winddata[,2], v.std=winddata[,5],
##D   dir.avg=winddata[,14])
##D set2 <- set(height=30, v.avg=winddata[,6], v.std=winddata[,9],
##D   dir.avg=winddata[,16])
##D set3 <- set(height=20, v.avg=winddata[,10], v.std=winddata[,13])
##D ts <- timestamp(timestamp=winddata[,1])
##D neubuerg <- mast(timestamp=ts, set1, set2, set3)
##D neubuerg <- clean(mast=neubuerg)
##D 
##D 
##D ## calculate Energy object
##D # calculate Weibull object
##D neubuerg.wb <- weibull(mast=neubuerg, v.set=1, print=FALSE)
##D 
##D # calculate energy
##D neubuerg.e <- energy(wb=neubuerg.wb)
##D 
##D # calculate energy for 1 m/s speed bins and without binning
##D energy(wb=neubuerg.wb, bins=0:25)
##D energy(wb=neubuerg.wb, bins=NULL)
##D 
##D # calculate energy with site specific air density
##D energy(wb=neubuerg.wb, rho=1.115, bins=NULL)
##D 
##D # change number of digits and hide results
##D energy(wb=neubuerg.wb, digits=2)
##D energy(wb=neubuerg.wb, print=FALSE)
##D 
##D 
##D ## plot energy objects
##D plot(neubuerg.e)  # default
##D plot(neubuerg.e, show.total=FALSE)  # omit total amount
##D plot(neubuerg.e, col=gray(5:0/5.5), cex=0.8)  # change colours/text sizes
##D plot(neubuerg.e, circles=c(100, 500, 100))  # manual definition of circles
##D plot(neubuerg.e, fg=TRUE)  # plot sectors in foreground
##D plot(neubuerg.e, pos.axis=135)  # change axis label position
##D plot(neubuerg.e, width.leg=0)  # no legend
##D 
##D # freaky
##D plot(neubuerg.e, border.leg=heat.colors(5), bty.leg="o", 
##D   cex.axis=0.5, cex.lab=2, cex.leg=0.5, circles=c(80, 800, 80), 
##D   col=rainbow(5), col.axis="green", col.border="orange", 
##D   col.circle="purple", col.cross="yellow", col.lab="pink", 
##D   col.leg="lightblue", fg=TRUE, lwd.border=2, lwd.circle=3, lwd.cross=4, 
##D   lty.circle="52168319", lty.cross="12223242", sec.space=0.6, 
##D   title.leg="* WiNd SpEeD *", x.intersp=2, y.intersp=5)
## End(Not run)




library(bReeze)


### Name: aep
### Title: Calculation of annual energy production
### Aliases: aep plot.aep
### Keywords: methods

### ** Examples

## Not run: 
##D ## load and prepare data
##D data("winddata", package="bReeze")
##D set1 <- set(height=40, v.avg=winddata[,2], v.std=winddata[,5],
##D   dir.avg=winddata[,14])
##D set2 <- set(height=30, v.avg=winddata[,6], v.std=winddata[,9],
##D   dir.avg=winddata[,16])
##D ts <- timestamp(timestamp=winddata[,1])
##D neubuerg <- mast(timestamp=ts, set1, set2)
##D neubuerg <- clean(mast=neubuerg)
##D 
##D 
##D ## calculate AEP
##D # calculate wind profile
##D neubuerg.wp <- profile(mast=neubuerg, v.set=c(1,2), dir.set=1, 
##D   print=FALSE)
##D 
##D # load power curve
##D pw.56 <- pc("PowerWind_56_900kW.wtg")
##D 
##D # calculate AEP
##D aep(profile=neubuerg.wp, pc=pw.56, hub.h=71)
##D 
##D # calculate AEP with site specific air density and availability of 97##D 
##D aep(profile=neubuerg.wp, pc=pw.56, hub.h=71, rho=1.195, avail=0.97)
##D 
##D # calculate total AEP using sectoral profiles
##D aep(profile=neubuerg.wp, pc=pw.56, hub.h=71, sectoral=TRUE)
##D 
##D # calculate AEP for 1 m/s speed bins and without binning
##D aep(profile=neubuerg.wp, pc=pw.56, hub.h=71, bins=seq(0,25))
##D aep(profile=neubuerg.wp, pc=pw.56, hub.h=71, bins=NULL)
##D 
##D # change number of digits and hide results
##D aep(profile=neubuerg.wp, pc=pw.56, hub.h=71, digits=c(1,1,1,1))
##D neubuerg.aep <- aep(profile=neubuerg.wp, pc=pw.56, hub.h=71, print=FALSE)
##D neubuerg.aep
##D 
##D 
##D ## plot AEP objects
##D # default
##D plot(neubuerg.aep)
##D 
##D # omit total AEP
##D plot(neubuerg.aep, show.total=FALSE)
##D 
##D # change colours and text sizes
##D plot(neubuerg.aep, col=gray(5:0 / 5), cex=0.8)
##D 
##D # manual definition of circles
##D plot(neubuerg.aep, circles=c(250, 750, 250))
##D 
##D # plot sectors in foreground
##D plot(neubuerg.aep, fg=TRUE)
##D 
##D # change position of axis labels
##D plot(neubuerg.aep, pos.axis=135)
##D 
##D # no legend
##D plot(neubuerg.aep, width.leg=0)
##D 
##D # freaky
##D plot(neubuerg.aep, border.leg=heat.colors(5), bty.leg="o", 
##D   cex.axis=0.5, cex.lab=2, cex.leg=0.5, circles=c(80, 800, 80), 
##D   col=rainbow(5), col.axis="green", col.border="orange", 
##D   col.circle="purple", col.cross="yellow", col.lab="pink", 
##D   col.leg="lightblue", fg=TRUE, lwd.border=2, lwd.circle=3, 
##D   lwd.cross=4, lty.circle="12345678", lty.cross="87654321", 
##D   sec.space=0.6, title.leg="* WiNd SpEeD *", x.intersp=2, y.intersp=5)
## End(Not run)




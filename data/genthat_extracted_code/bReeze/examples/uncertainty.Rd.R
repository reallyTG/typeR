library(bReeze)


### Name: uncertainty
### Title: Uncertainty assessment
### Aliases: uncertainty uc plot.uncertainty
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
##D ## calculate uncertainty
##D # calculate AEP
##D nb.wp <- profile(mast=neubuerg, v.set=c(1,2), dir.set=1, 
##D   print=FALSE)
##D pw.56 <- pc("PowerWind_56_900kW.wtg")
##D nb.aep <- aep(profile=nb.wp, pc=pw.56, hub.h=71, print=FALSE)
##D 
##D # calculate uncertainty
##D uncertainty(nb.aep, uc.values=c(5,10,5,5), 
##D   uc.names=c("Wind Measurement Mast", "Long Term Correlation", 
##D   "Flow Model", "Power Curve"))
##D 
##D # unnamed uncertainty components
##D uncertainty(nb.aep, uc.values=c(5,10,5,5), 
##D   uc.names=NULL)
##D 
##D # new name for combined uncertainty
##D uncertainty(nb.aep, uc.values=c(5,10,5,5), 
##D   uc.names=c("Wind Measurement Mast", "Long Term Correlation", 
##D   "Flow Model", "Power Curve", "Total Uncertainty"))
##D 
##D # changed probability values
##D uncertainty(nb.aep, uc.values=c(5,10,5,5), 
##D   uc.names=c("Wind Measurement Mast", "Long Term Correlation", 
##D   "Flow Model", "Power Curve"), prob=seq(50,90,10))
##D 
##D # change number of digits and hide results
##D neubuerg.uc <- uncertainty(nb.aep, uc.values=c(5,10,5,5), 
##D   uc.names=c("Wind Measurement Mast", "Long Term Correlation", 
##D   "Flow Model", "Power Curve"), digits=c(1,2), print=FALSE)
##D neubuerg.uc
##D 
##D 
##D ## plot uncertainty objects - probability of exceedance plot 
##D plot(neubuerg.uc)  # default
##D plot(neubuerg.uc, p.values=c(50, 95))  # change highlighted P-values
##D 
##D # change colours, line types, line width and text size
##D plot(neubuerg.uc, col="blue", lty=c(1, 2, 3, 4), lwd=2, cex=1.2)
##D 
##D # freaky
##D plot(neubuerg.uc, bty="l", bty.leg="o", cex.axis=2, 
##D   cex.lab=0.5, cex.leg=0.8, col=c(5, 10, 15, 20), col.axis="sienna", 
##D   col.box="purple", col.lab="plum", col.leg="orchid", col.ticks="gold", 
##D   las=0, lty=c(8, 7, 6, 5), lwd=c(5, 3, 1, 0.5), mar=c(6, 5, 4, 3), 
##D   mgp=c(4, 2, 1), pos.leg="bottomleft", xlim=c(0.1, 0.9), ylim=c(1000, 2000), 
##D   x.intersp=2, y.intersp=1.5)
##D 
##D 
##D ## plot uncertainty objects - uncertainty overview plot
##D plot(neubuerg.uc, type="uncert")  # default
##D 
##D # change colours and border
##D plot(neubuerg.uc, type="uncert", col="red", border="red4")
##D plot(neubuerg.uc, type="uncert", col=c(gray(0.7), gray(0.5)), 
##D   border=c(gray(0.6), gray(0.4)))
##D plot(neubuerg.uc, type="uncert", col=c(5:1), border=c(1:5))
##D 
##D # change text size, space and margin
##D plot(neubuerg.uc, type="uncert", cex=1.5, space=0.1, mar=c(1, 13, 1, 1))
##D 
##D # freaky
##D plot(neubuerg.uc, type="uncert", border=c(11, 22, 33, 44, 55), cex.axis=0.7, 
##D   cex.text=2, col=c("maroon", "navy", "thistle", "rosybrown", "papayawhip"), 
##D   col.axis="pink3", col.text="seagreen", mar=c(3, 8, 2, 1), mgp=c(0, 1, 2), space=1)
## End(Not run)




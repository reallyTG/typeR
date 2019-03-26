library(hds)


### Name: hdslc
### Title: Hazard discrimination summary estimator
### Aliases: hdslc

### ** Examples

## Not run: 
##D head(hdslc(times = survival::pbc[1:312, 2],
##D            status = (survival::pbc[1:312, 3]==2)*1,
##D            m = survival::pbc[1:312, 5]))
##D 
##D hdsres   <- hds(times=pbc5[,1], status=pbc5[,2], m=pbc5[,3:7])
##D hdslcres <- hdslc(times = pbc5[,1], status=pbc5[,2], m = pbc5[,3:7], h = 730)
##D Survt    <- summary(survival::survfit(survival::Surv(pbc5[,1], pbc5[,2])~1))
##D Survtd   <- cbind(Survt$time, c(0,diff(1-Survt$surv)))
##D tden     <- density(x=Survtd[,1], weights=Survtd[,2], bw=100, kernel="epanechnikov")
##D 
##D par(mar=c(2.25,2.25,0,0)+0.1, mgp=c(1.25,0.5,0))
##D plot(c(hdslcres[,1], hdslcres[,1]), c(hdslcres[,2] - 1.96*hdslcres[,3],
##D                                       hdslcres[,2] + 1.96*hdslcres[,3]),
##D      type="n", xlab="days", ylab="HDS(t)", cex.lab=.75, cex.axis=.75,
##D      ylim=c(-3,15), xlim=c(0,3650))
##D polygon(x=c(hdsres[,1], hdsres[312:1,1]), col=rgb(1,0,0,.25), border=NA,
##D         fillOddEven=TRUE, y=c(hdsres[,2]+1.96*hdsres[,3],
##D                               (hdsres[,2]-1.96*hdsres[,3])[312:1]))
##D polygon(x=c(hdslcres[,1], hdslcres[312:1, 1]), col=rgb(0,0,1,.25), border=NA,
##D         fillOddEven=TRUE, y=c(hdslcres[,2] + 1.96*hdslcres[,3],
##D                               (hdslcres[,2] - 1.96*hdslcres[,3])[312:1]))
##D lines(hdsres[,1], hdsres[,2], lwd=2, col="red")
##D lines(hdslcres[,1], hdslcres[,2], lwd=2, col="blue")
##D abline(h=1, lty=3)
##D legend(x=1200, y=14, legend=c("Proportional hazards",
##D                               "Local-in-time proportional hazards",
##D                               "Time density"), col=c("red", "blue", "gray"),
##D        lwd=2, bty="n", cex=0.75)
##D with(tden, polygon(c(x, x[length(x):1]),
##D                    c(y*3/max(y)-3.5, rep(-3.5, length(x))),
##D                    col="gray", border=NA, fillOddEven=TRUE))
## End(Not run)





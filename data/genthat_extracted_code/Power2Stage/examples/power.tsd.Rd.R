library(Power2Stage)


### Name: power.tsd
### Title: Power calculation of adaptive 2-stage BE studies in a 2x2
###   crossover design
### Aliases: power.2stage power.tsd

### ** Examples

# using all the defaults and 24 subjects in stage 1, CV of 25%
power.tsd(n1=24, CV=0.25)
# computation time ~ 1 sec
#
# as above, but save results for further use
res <- power.tsd(n1=24, CV=0.25)
## Not run: 
##D # representation of the discrete distribution of n(total)
##D # via plot method of object with class "table" which creates a
##D # 'needle' plot
##D plot(res$ntable/sum(res$ntable), ylab="Density",
##D      xlab=expression("n"[total]), las=1,
##D      main=expression("Distribution of n"[total]))
##D #
##D # If you prefer a histogram instead (IMHO, not the preferred plot):
##D # reconstruct the ntotal values from the ntable
##D ntot <- rep.int(as.integer(names(res$ntable)),
##D                 times=as.integer(res$ntable))
##D # annotated histogram
##D hist(ntot, freq=FALSE, breaks=res$nrange[2]-res$nrange[1],
##D      xlab=expression("n"[total]), las=1,
##D      main=expression("Histogram of n"[total]))
##D abline(v=c(res$nmean, res$nperc[["50%"]]), lty=c(1, 3))
##D legend("topright", box.lty=0, legend=c("mean", "median"),
##D        lty=c(1, 3), cex=0.9)
## End(Not run)




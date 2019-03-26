library(BAMMtools)


### Name: getRateThroughTimeMatrix
### Title: Generate rate-through-time matrix from 'bammdata' object
### Aliases: getRateThroughTimeMatrix
### Keywords: models

### ** Examples

## Not run: 
##D # Plot a rate-through-time curve with 
##D # confidence intervals for the whale dataset:
##D 
##D data(whales, events.whales)
##D ed <- getEventData(whales, events.whales)
##D 
##D rmat <- getRateThroughTimeMatrix(ed)
##D 
##D plot.new()
##D plot.window(xlim=c(0, 36), ylim=c(0, .7))
##D 
##D ## Speciation quantiles: plot 90% CIs
##D qq <- apply(rmat$lambda, 2, quantile, c(0.05, 0.5, 0.95))
##D 
##D xv <- c(rmat$times, rev(rmat$times))
##D yv <- c(qq[1,], rev(qq[3,]))
##D 
##D ## Add the confidence polygon on rate distributions:
##D polygon(xv, yv, col='gray80', border=FALSE)
##D 
##D ## Add the median rate line:
##D lines(rmat$times, qq[2,], lwd=3, col='red')
##D 
##D ## Add axes
##D axis(1, at=seq(-5, 35, by=5))
##D axis(2, at=seq(-0.2, 1, by=0.2), las=1)
##D 
##D ####### Now we will show the actual grid used for rate calculations:
##D 
##D plot(whales, show.tip.label=FALSE)
##D axisPhylo()
##D 
##D mbt <- max(branching.times(whales))
##D tvec <- mbt - rmat$times;
##D tvec <- rmat$times;
##D 
##D for (i in 1:length(tvec)){
##D     lines(x=c(tvec[i], tvec[i]), y=c(0, 90), lwd=0.7, col='gray70')
##D }
##D 
##D ## This shows the grid of time slices over the phylogeny
## End(Not run)




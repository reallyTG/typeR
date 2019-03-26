library(BAMMtools)


### Name: plotRateThroughTime
### Title: Plot rates through time
### Aliases: plotRateThroughTime

### ** Examples

## Not run: 
##D data(events.whales)
##D data(whales)
##D ephy <- getEventData(whales,events.whales)
##D 
##D # Simple plot of rates through time with default settings
##D plotRateThroughTime(ephy)
##D 
##D # Plot two processes separately with 90% CI and loess smoothing
##D plotRateThroughTime(ephy, intervals=seq(from=0,0.9,by=0.01), smooth=TRUE,
##D                     node=141, nodetype='exclude', ylim=c(0,1.2))
##D 
##D plotRateThroughTime(ephy, intervals=seq(from=0,0.9,by=0.01), smooth=TRUE, 
##D                     node=141, nodetype='include', add=TRUE,
##D                     intervalCol='orange')
##D 
##D legend('topleft', legend=c('Dolphins','Whales'), col='red',
##D     fill=c('orange','blue'), border=FALSE, lty=1, lwd=2, merge=TRUE,
##D            seg.len=0.6)
##D 
##D # Same plot, but from bamm-ratematrix objects
##D rmat1 <- getRateThroughTimeMatrix(ephy, node=141, nodetype='exclude')
##D rmat2 <- getRateThroughTimeMatrix(ephy, node=141, nodetype='include')
##D 
##D plotRateThroughTime(rmat1, intervals=seq(from=0,0.9,by=0.01), 
##D     smooth=TRUE, ylim=c(0,1.2))
##D 
##D plotRateThroughTime(rmat2, intervals=seq(from=0,0.9,by=0.01), 
##D     smooth=TRUE, add=TRUE, intervalCol='orange')
##D 
##D # To plot the mean rate without the confidence envelope
##D plotRateThroughTime(ephy,useMedian=FALSE, intervals=NULL)
##D 
##D # To plot the mean rate, with a single 95% confidence envelope, grayscale
##D plotRateThroughTime(ephy,useMedian=FALSE, intervals=c(0.05,0.95),
##D     intervalCol='gray70', avgCol='black', opacity=1)
##D 
##D # To not plot, but instead return the plotting data generated in this
##D # function, we can make plot=FALSE
##D plotRateThroughTime(ephy, plot=FALSE)
## End(Not run)




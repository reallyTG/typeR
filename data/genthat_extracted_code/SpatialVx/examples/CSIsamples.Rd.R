library(SpatialVx)


### Name: CSIsamples
### Title: Forecast Verification with Cluster Analysis: The Variation
### Aliases: CSIsamples CSIsamples.default CSIsamples.SpatialVx
###   summary.CSIsamples plot.CSIsamples plot.summary.CSIsamples
###   print.CSIsamples
### Keywords: cluster hplot

### ** Examples

## Not run: 
##D grid<- list( x= seq( 0,5,,100), y= seq(0,5,,100))
##D obj<-Exp.image.cov( grid=grid, theta=.5, setup=TRUE)
##D look<- sim.rf( obj)
##D look2 <- sim.rf( obj)
##D 
##D res <- CSIsamples(x=look, xhat=look2, 10, threshold=0, k=100,
##D                   width=2, z.mult=0, hit.threshold=0.25, max.csi.clust=75)
##D plot(res)
##D y <- summary(res)
##D plot(y)
## End(Not run)
## Not run: 
##D data(UKfcst6)
##D data(UKobs6)
##D data(UKloc)
##D 
##D hold <- make.SpatialVx(UKobs6, UKfcst6, thresholds=0,
##D     loc=UKloc, map=TRUE, field.type="Rainfall", units="mm/h",
##D     data.name = "Nimrod", obs.name = "obs 6", model.name = "fcst 6" )
##D 
##D res <- CSIsamples( hold, threshold = 0, k = 200, z.mult = 0.3, hit.threshold = 0.2,
##D                   max.csi.clust = 150, verbose = TRUE)
##D plot( res )
##D 
##D summary( res )
##D 
##D y <- summary( res )
##D 
##D plot( y )
## End(Not run)




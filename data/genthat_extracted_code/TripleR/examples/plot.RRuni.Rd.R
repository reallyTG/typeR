library(TripleR)


### Name: plot.RRuni
### Title: Plot variance components from SRAs
### Aliases: plot.RRuni plot.RRbi plot.RRmulti

### ** Examples

## Not run: 
##D 	data(likingLong)
##D 	RR1 <- RR(liking_a ~ perceiver.id*target.id, data=likingLong)
##D 	plot(RR1)
##D 	plot(RR1, geom="pie")
##D 	
##D 	RR2 <- RR(liking_a + metaliking_a ~ perceiver.id*target.id, data=likingLong)
##D 	plot(RR2)
##D 	
##D 	
##D 	data("multiLikingLong")
##D 	RR1m <- RR(liking_a ~ perceiver.id*target.id|group.id, data=multiLikingLong)
##D 	plot(RR1m)
##D 	plot(RR1m, measure="perception")
##D 	plot(RR1m, measure="perception", geom="bar")
##D 	plot(RR1m, measure="perception", connect=TRUE)
##D 
##D 	RR2m <- RR(liking_a + metaliking_a ~ perceiver.id*target.id|group.id, data=multiLikingLong)
##D 	plot(RR2m)
## End(Not run)




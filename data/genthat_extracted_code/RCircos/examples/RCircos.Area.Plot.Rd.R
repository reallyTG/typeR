library(RCircos)


### Name: RCircos.Area.Plot
### Title: Paint Areas on One Data Track
### Aliases: RCircos.Area.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram);
##D data(RCircos.Polygon.Data);
##D 
##D RCircos.Set.Core.Components(  
##D     cyto.info=UCSC.HG19.Human.CytoBandIdeogram,  
##D     chr.exclude=c("chrX", "chrY"), 
##D     tracks.inside=10, tracks.outside=5)  
##D RCircos.Set.Plot.Area();
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D load("RCircos/data/RCircos.Histogram.Data.RData")
##D 
##D area.data <- RCircos.Histogram.Data;
##D adj.value <- runif(nrow(area.data), 0, 0.4)
##D area.data["DataT"] <- 0.5 + adj.value
##D area.data["DataB"] <- 0.5 - adj.value
##D 
##D RCircos.Area.Plot(area.data, data.col=4, plot.type="mountain", 
##D     inside.pos=1.2, outside.pos=1.5, is.sorted=FALSE)
##D 
##D RCircos.Area.Plot(area.data, data.col=4, plot.type="curtain", 
##D     inside.pos=0.9, outside.pos=1.1, is.sorted=FALSE)
##D 
##D RCircos.Area.Plot(area.data, data.col=c(5,6), plot.type="band", 
##D     inside.pos=0.4, outside.pos=0.7, is.sorted=FALSE)
## End(Not run)




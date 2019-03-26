library(RCircos)


### Name: RCircos.Histogram.Plot
### Title: Plot Histogram for One Data Track
### Aliases: RCircos.Histogram.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram);
##D data(RCircos.Histogram.Data);
##D 
##D RCircos.Set.Core.Components(
##D 	cyto.info=UCSC.HG19.Human.CytoBandIdeogram, 
##D 	chr.exclude=c("chrX", "chrY"), 
##D 	tracks.inside=10, tracks.outside=5) 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D RCircos.Histogram.Plot(RCircos.Histogram.Data, 
##D 	data.col=4, track.num=1, side="in")
##D RCircos.Histogram.Plot(RCircos.Histogram.Data, 
##D 	data.col=4, side="in", inside.pos=1.7, 
##D 	outside.pos=1.8)
## End(Not run)




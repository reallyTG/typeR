library(RCircos)


### Name: RCircos.Point.Plot
### Title: Point Plot for One Data Track
### Aliases: RCircos.Point.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos)
##D data(UCSC.HG19.Human.CytoBandIdeogram)
##D 
##D RCircos.Set.Core.Components(
##D 	cyto.info=UCSC.HG19.Human.CytoBandIdeogram,
##D 	chr.exclude=c("chrX", "chrY"), 
##D 	num.inside=10, num.outside=0)
##D 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D data(RCircos.Scatter.Data)
##D RCircos.Scatter.Plot(RCircos.Scatter.Data, 
##D 	data.col=5, track.num=4, side="in", 
##D 	with.height=TRUE, with.size=FALSE)
## End(Not run)




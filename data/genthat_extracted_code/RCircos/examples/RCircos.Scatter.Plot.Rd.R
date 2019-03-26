library(RCircos)


### Name: RCircos.Scatter.Plot
### Title: Scater Plot for One Data Track
### Aliases: RCircos.Scatter.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos)
##D data(UCSC.HG19.Human.CytoBandIdeogram)
##D RCircos.Set.Core.Components(
##D 	cyto.info=UCSC.HG19.Human.CytoBandIdeogram, 
##D 	chr.exclude=c("chrX", "chrY"), 
##D 	tracks.inside=10, tracks.outside=0) 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D data(RCircos.Scatter.Data)
##D RCircos.Scatter.Plot(RCircos.Scatter.Data, data.col=5, 
##D 	track.num=4, side="in", by.fold=1)
## End(Not run)




library(RCircos)


### Name: RCircos.Heatmap.Plot
### Title: Draw Heatmap for One Data Track
### Aliases: RCircos.Heatmap.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos)
##D data(UCSC.HG19.Human.CytoBandIdeogram)
##D data(RCircos.Heatmap.Data)
##D 
##D RCircos.Set.Core.Components(
##D 	cyto.info=UCSC.HG19.Human.CytoBandIdeogram, 
##D 	chr.exclude=c("chrX", "chrY"), 
##D 	tracks.inside=10, tracks.outside=0) 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D RCircos.Heatmap.Plot(RCircos.Heatmap.Data, data.col=5, 
##D 	track.num=4, side="in")
##D RCircos.Heatmap.Plot(RCircos.Heatmap.Data, data.col=5, 
##D 	side="in", inside.pos=0.9, outside.pos=1.2)
## End(Not run)




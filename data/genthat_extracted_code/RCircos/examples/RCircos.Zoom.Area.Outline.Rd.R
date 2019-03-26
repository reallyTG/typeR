library(RCircos)


### Name: RCircos.Zoom.Area.Outline
### Title: Draw Outline for Zoom Plot Area
### Aliases: RCircos.Zoom.Area.Outline
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram)
##D 
##D RCircos.Set.Core.Components(
##D 	cyto.info=UCSC.HG19.Human.CytoBandIdeogram, 
##D 	chr.exclude=c("chrX", "chrY"), 
##D 	tracks.inside=10, tracks.outside=5) 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D data(RCircos.Heatmap.Data)
##D zoom.data <- RCircos.Get.Zoom.Data(RCircos.Heatmap.Data, 
##D 			name.col=4, genomic.columns=3,
##D 			target.gene="SP5", neighbor.genes=5)
##D zoom.range <- RCircos.Get.Zoom.Range(zoom.data, 3)
##D zoom.pos <- RCircos.Set.Zoom.Plot.Positions(zoom.range, 
##D         total.genes=11, area.length=0.25, gene.width=NULL)
##D 
##D RCircos.Zoom.Area.Outline(zoom.pos=NULL, inside.pos=2.5,
##D 	outside.pos=3, num.layers=5, fill.col="white")
## End(Not run)




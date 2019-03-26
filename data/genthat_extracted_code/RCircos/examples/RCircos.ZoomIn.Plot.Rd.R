library(RCircos)


### Name: RCircos.ZoomIn.Plot
### Title: Zoomed-in Plot of Small Genomic Region
### Aliases: RCircos.Plot.Zoomed.Area RCircos.Plot.Zoomed.Gene.Connectors
###   RCircos.Plot.Zoomed.Heatmap RCircos.Plot.Zoomed.Histogram
###   RCircos.Plot.Zoomed.Ideogram.Ticks RCircos.Plot.Zoomed.Continue.Lines
###   RCircos.Plot.Zoomed.Parallel.Lines RCircos.Plot.Zoomed.Vertical.Lines
###   RCircos.Plot.Zoomed.Scatters RCircos.Plot.Zoomed.Tiles
###   RCircos.Plot.Zoomed.Polygons RCircos.Label.Zoom.Region
###   RCircos.Mark.Zoom.Area
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram)
##D 
##D cyto <- UCSC.HG19.Human.CytoBandIdeogram
##D RCircos.Set.Core.Components(cyto, NULL, 10, 5)
##D 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D data(RCircos.Heatmap.Data)
##D min.value <- min(as.matrix(RCircos.Heatmap.Data[,5:10]))
##D max.value <- max(as.matrix(RCircos.Heatmap.Data[,5:10]))
##D 
##D zoom.data <- RCircos.Get.Zoom.Data(RCircos.Heatmap.Data,
##D         name.col=4, genomic.columns=3,
##D         target.gene="SP5", neighbor.genes=5)
##D zoom.range <- RCircos.Get.Zoom.Range(zoom.data, 3)
##D zoom.pos <- RCircos.Set.Zoom.Plot.Positions(zoom.range,
##D         total.genes=11, area.length=0.25, gene.width=NULL)
##D 
##D RCircos.Plot.Zoomed.Heatmap(zoom.data, data.col=5,
##D         track.num=2, zoom.pos=zoom.pos,
##D         min.value=min.value, max.value=max.value,
##D         inside.pos=NULL, outside.pos=NULL)
##D 
##D RCircos.Mark.Zoom.Area(zoom.pos, zoom.data, color="red",
##D         track.num=2, inside.pos=NULL, outside.pos=NULL)
##D 
##D RCircos.Label.Zoom.Region(zoom.data, name.col=4,
##D         track.num=3, zoom.pos=zoom.pos, text.size=0.75,
##D         inside.pos=NULL, outside.pos=NULL)
## End(Not run)




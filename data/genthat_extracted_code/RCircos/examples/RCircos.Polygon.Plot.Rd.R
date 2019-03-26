library(RCircos)


### Name: RCircos.Polygon.Plot
### Title: Draw Polygons on One Data Track
### Aliases: RCircos.Polygon.Plot
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
##D RCircos.Polygon.Plot(RCircos.Polygon.Data,  
##D     track.num=1, side="in")
## End(Not run)




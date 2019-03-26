library(RCircos)


### Name: RCircos.Tile.Plot
### Title: Plot Tiles for One Data Track
### Aliases: RCircos.Tile.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram);
##D 
##D RCircos.Set.Core.Components(
##D 	cyto.info=UCSC.HG19.Human.CytoBandIdeogram, 
##D 	chr.exclude=c("chrX", "chrY"), 
##D 	tracks.inside=10, tracks.outside=0) 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D data(RCircos.Tile.Data);
##D RCircos.Tile.Plot(tile.data=RCircos.Tile.Data, 
##D 	track.num=4, side="in")
## End(Not run)




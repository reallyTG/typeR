library(RCircos)


### Name: RCircos.Vertical.Line.Plot
### Title: Draw Vertical Lines on One Data Track
### Aliases: RCircos.Vertical.Line.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram);
##D data(RCircos.Line.Data);
##D 
##D RCircos.Set.Core.Components(
##D     cyto.info=UCSC.HG19.Human.CytoBandIdeogram, 
##D     chr.exclude=c("chrX", "chrY"), 
##D     tracks.inside=10, tracks.outside=5) 
##D RCircos.Set.Plot.Area();
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D RCircos.Vertical.Line.Plot(RCircos.Line.Data, track.num=1, side="in")
##D RCircos.Vertical.Line.Plot(RCircos.Line.Data, side="in", 
##D     inside.pos=1.5, outside.pos=1.75)
## End(Not run)




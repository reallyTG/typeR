library(RCircos)


### Name: RCircos.Parallel.Line.Plot
### Title: Draw Lines between Two Genomic Positions on Same Chromosome
### Aliases: RCircos.Parallel.Line.Plot
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
##D RCircos.Parallel.Line.Plot(line.data, track.num=5, side="in")
##D RCircos.Parallel.Line.Plot(line.data, line.width=2, 
##D     inside.pos=2, outside.pos=2.5)
## End(Not run)




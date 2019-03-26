library(RCircos)


### Name: RCircos.Link.Plot
### Title: Draw Link Lines between Two or More Genomic Positions
### Aliases: RCircos.Link.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram);
##D data(RCircos.Link.Data);
##D 
##D RCircos.Set.Core.Components(
##D 	cyto.inf=UCSC.HG19.Human.CytoBandIdeogram,  
##D 	chr.exclude=c("chrX", "chrY"), 
##D 	num.inside=10, num.outside=0)
##D 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D RCircos.Link.Plot(RCircos.Link.Data, track.num=4,
##D 	by.chromosome=TRUE)
##D RCircos.Link.Plot(RCircos.Link.Data, start.pos=0.75,
##D 	by.chromosome=TRUE)
## End(Not run)




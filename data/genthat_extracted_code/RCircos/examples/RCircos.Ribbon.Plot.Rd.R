library(RCircos)


### Name: RCircos.Ribbon.Plot
### Title: Draw Ribbon between Two Genomic Regions
### Aliases: RCircos.Ribbon.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos)
##D data(UCSC.HG19.Human.CytoBandIdeogram);
##D data(RCircos.Link.Data);
##D data(RCircos.Ribbon.Data);
##D 
##D cyto.info <- UCSC.HG19.Human.CytoBandIdeogram
##D chr.exclude <- c("chrX", "chrY")
##D RCircos.Set.Core.Components(
##D 	cyto.info=UCSC.HG19.Human.CytoBandIdeogram, 
##D 	chr.exclude=c("chrX", "chrY"), 
##D 	tracks.inside=10, tracks.outside=0) 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D RCircos.Link.Plot(RCircos.Link.Data, track.num=4, twist=TRUE)
##D RCircos.Ribbon.Plot(RCircos.Ribbon.Data, 
##D 	track.num=4, twist=TRUE, by.chromosome=FALSE)
## End(Not run)




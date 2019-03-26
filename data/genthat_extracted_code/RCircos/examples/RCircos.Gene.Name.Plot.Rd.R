library(RCircos)


### Name: RCircos.Gene.Name.Plot
### Title: Draw Gene Names on a Data Track
### Aliases: RCircos.Gene.Name.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos)
##D data(UCSC.HG19.Human.CytoBandIdeogram)
##D data(RCircos.Gene.Label.Data)
##D 
##D cyto.info <- UCSC.HG19.Human.CytoBandIdeogram
##D RCircos.Set.Core.Components(cyto.info,  
##D     chr.exclude=c("chrX", "chrY"),  
##D     num.inside=10, num.outside=0)
##D 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D gene.data <- RCircos.Gene.Label.Data;
##D RCircos.Gene.Name.Plot(gene.data, name.col=4,  
##D     track.num=2, side="in")
##D RCircos.Gene.Name.Plot(gene.data, name.col=4,  
##D     track.num=2, side="out",  
##D     inside.pos=2.5, outside.pos=3)
## End(Not run)




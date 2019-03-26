library(RCircos)


### Name: RCircos.Gene.Connector.Plot
### Title: Draw Connectors between Chromosome Ideogram and Gene Names
### Aliases: RCircos.Gene.Connector.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos)
##D data(RCircos.Gene.Label.Data)
##D data(UCSC.HG19.Human.CytoBandIdeogram)
##D 
##D cyto.info <- UCSC.HG19.Human.CytoBandIdeogram;
##D RCircos.Set.Core.Components(cyto.info, chr.exclude=NULL,  
##D        tracks.inside=10, tracks.outside=0)
##D 
##D gene.data <- RCircos.Gene.Label.Data
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D RCircos.Gene.Connector.Plot(gene.data, track.num=1, side="in")
##D RCircos.Gene.Connector.Plot(gene.data, side="out",  
##D     inside.pos=2.5, outside.pos=3)
## End(Not run)




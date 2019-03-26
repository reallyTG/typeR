library(RCircos)


### Name: RCircos.Area.Highlight
### Title: Highlight PLot Area Cross One or More Tracks
### Aliases: RCircos.Area.Highlight
### Keywords: method

### ** Examples

## Not run: 
##D library(RCircos)
##D data(UCSC.HG19.Human.CytoBandIdeogram)
##D data(RCircos.Gene.Label.Data)
##D 
##D RCircos.Set.Core.Components(UCSC.HG19.Human.CytoBandIdeogram,  
##D     chr.exclude=NULL, tracks.inside=10, tracks.outside=0)
##D 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D highlight.area <- c("chr1", 100000, 200000)
##D RCircos.Area.Highlight(highlight.area=c("chr1", 100000, 200000),  
##D     track.num=c(1:3), side="in")
##D RCircos.Area.Highlight(highlight.areac("chr10", 100000, 200000),  
##D     inside.pos=1.5, outside.pos=2)  
## End(Not run)




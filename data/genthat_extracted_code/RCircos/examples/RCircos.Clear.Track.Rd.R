library(RCircos)


### Name: RCircos.Clear.Track
### Title: Erase One or More Data Tracks
### Aliases: RCircos.Clear.Track
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram)
##D data(RCircos.Link.Data)
##D data(RCircos.Scatter.Data)
##D 
##D RCircos.Set.Core.Components(UCSC.HG19.Human.CytoBandIdeogram,  
##D     chr.exclude=c("chrX", "chrY"),  
##D     tracks.inside=10, tracks.outside=0 )
##D 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D RCircos.Scatter.Plot(RCircos.Scatter.Data, data.col=5,  
##D     track.num=1, side="in", by.fold=1)
##D RCircos.Link.Plot(RCircos.Link.Data, track.num=3)  
##D 
##D RCircos.Clear.Track(track.num=1, side="in", to.center=FALSE)
##D RCircos.Clear.Track(track.num=5, side="in", to.center=TRUE) 
## End(Not run)




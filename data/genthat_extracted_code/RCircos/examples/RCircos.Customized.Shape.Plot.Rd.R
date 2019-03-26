library(RCircos)


### Name: RCircos.Customized.Shape.Plot
### Title: Plot A Customized Shape
### Aliases: RCircos.Customized.Shape.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos)  
##D 
##D data(UCSC.HG19.Human.CytoBandIdeogram)
##D RCircos.Set.Core.Components(UCSC.HG19.Human.CytoBandIdeogram,  
##D     chr.exclude=NULL, tracks.inside=10, tracks.outside=0)
##D 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D shape <- cbind(c(0, -0.7, -0.2, -0.2, 0.2, 0.2, 0.7, 0),  
##D         c(-1, 0.7,  0.4,  1,   1,   0.4, 0.7, -1))
##D RCircos.Customized.Shape.Plot(shape, track.num=1, side="in")
## End(Not run)




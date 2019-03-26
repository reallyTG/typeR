library(RCircos)


### Name: RCircos.Set.Zoom.Plot.Positions
### Title: Set Position for Zoom-in Plot
### Aliases: RCircos.Set.Zoom.Plot.Positions
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos)
##D data(UCSC.HG19.Human.CytoBandIdeogram);
##D 
##D RCircos.Set.Core.Components(
##D 	cyto.info=UCSC.HG19.Human.CytoBandIdeogram, 
##D 	chr.exclude=c("chrX", "chrY"), 
##D 	tracks.inside=10, tracks.outside=0) 
##D 
##D zoom.info <- c("chr1", 10000, 50000)
##D zoom.pos <- RCircos.Set.Zoom.Plot.Positions(zoom.info)
## End(Not run)




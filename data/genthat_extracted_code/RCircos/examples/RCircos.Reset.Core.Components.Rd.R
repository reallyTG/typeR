library(RCircos)


### Name: RCircos.Reset.Core.Components
### Title: Reset Methods for Modifying RCircos Core Components
### Aliases: RCircos.Reset.Plot.Ideogram RCircos.Reset.Plot.Parameters
###   RCircos.Reset.Plot.Positions
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram);
##D 
##D RCircos.Set.Core.Components(
##D     cyto.info=UCSC.HG19.Human.CytoBandIdeogram, 
##D     chr.exclude=c("chrX", "chrY"), 
##D     tracks.inside=10, tracks.outside=5) 
##D 
##D ideo <- RCircos.Get.Plot.Ideogram()
##D rows <- which(ideo$BandColor=="red"
##D ideo$BandColor[rows] <- "green"
##D RCircos.Reset.Plot.Ideogram(ideo)
##D 
##D params <- RCircos.Get.Plot.Parameters()
##D params$base.per.unit <- 6000
##D RCircos.Reset.Plot.Paramters(params)
##D 
##D positions <- RCircos.Get.Plot.Positions();
##D positions[1, 3] <- 0;
##D RCircos.Reset.Plot.Positions(positions);
## End(Not run)




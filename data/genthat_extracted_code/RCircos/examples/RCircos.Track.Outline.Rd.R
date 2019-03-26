library(RCircos)


### Name: RCircos.Track.Outline
### Title: Draw Outline for A Data Track
### Aliases: RCircos.Track.Outline
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram);
##D 
##D RCircos.Set.Core.Components(
##D 	cyto.info=UCSC.HG19.Human.CytoBandIdeogram, 
##D 	chr.exclude=c("chrX", "chrY"), 
##D 	tracks.inside=10, tracks.outside=5) 
##D RCircos.Set.Plot.Area()
##D RCircos.Chromosome.Ideogram.Plot()
##D 
##D locations <- RCircos.Track.Positions(side="in", track.num=1);  
##D out.pos <- locations[1];
##D in.pos  <- locations[2];
##D subtracks <- 5;
##D RCircos.Track.Outline(inside.pos=locations[2], 
##D 	outside.pos=locations[1], num.layers=5,
##D 	chrom.list=NULL, track.colors=NULL) 
## End(Not run)




library(RCircos)


### Name: RCircos.Line.Plot
### Title: Draw Lines for One Data Track
### Aliases: RCircos.Line.Plot
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos);
##D data(UCSC.HG19.Human.CytoBandIdeogram);
##D data(RCircos.Line.Data);
##D 
##D RCircos.Set.Core.Components(  
##D     cyto.info=UCSC.HG19.Human.CytoBandIdeogram,  
##D     chr.exclude=c("chrX", "chrY"),  
##D     num.inside=10, num.outside=0) 
##D 
##D RCircos.Set.Plot.Area() 
##D RCircos.Chromosome.Ideogram.Plot()  
##D 
##D RCircos.Line.Plot(RCircos.Line.Data, data.col=5,  
##D     track.num=1, side="in")
##D RCircos.Line.Plot(RCircos.Line.Data, data.col=5,  
##D     side="in", inside.pos=1.5, outside.pos=1.75)  
## End(Not run)




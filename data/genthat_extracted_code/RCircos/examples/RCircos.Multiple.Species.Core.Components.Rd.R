library(RCircos)


### Name: RCircos.Multiple.Species.Core.Components
### Title: Setup RCircos Core Components with Multiple Species Genomes
### Aliases: RCircos.Multiple.Species.Core.Components
### Keywords: methods

### ** Examples

## Not run: 
##D library(RCircos)
##D data(UCSC.Mouse.GRCm38.CytoBandIdeogram)
##D data(UCSC.Baylor.3.4.Rat.cytoBandIdeogram)
##D 
##D cyto.list <- list(UCSC.Mouse.GRCm38.CytoBandIdeogram,  
##D                UCSC.Baylor.3.4.Rat.cytoBandIdeogram);
##D species <- c("M", "R")
##D 
##D RCircos.Multiple.Species.Core.Components(  
##D        cyto.list, species, chr.exclude=NULL,  
##D        tracks.inside=10, tracks.outside=0)
## End(Not run)




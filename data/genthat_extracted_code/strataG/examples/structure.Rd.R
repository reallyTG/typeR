library(strataG)


### Name: structure
### Title: STRUCTURE
### Aliases: structure structureRun structureWrite structureRead

### ** Examples

## Not run: 
##D data(msats.g)
##D 
##D # Run STRUCTURE
##D sr <- structureRun(msats.g, k.range = 1:4, num.k.rep = 10)
##D 
##D # Calculate Evanno metrics
##D evno <- evanno(sr)
##D evno
##D 
##D # Run CLUMPP to combine runs for K = 2
##D q.mat <- clumpp(sr, k = 3)
##D q.mat
##D 
##D # Plot CLUMPP results
##D structurePlot(q.mat)
## End(Not run)





library(lidR)


### Name: manual
### Title: Individual Tree Detection Algorithm
### Aliases: manual

### ** Examples

## Not run: 
##D LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
##D las = readLAS(LASfile)
##D 
##D # Full manual tree finding
##D ttops = tree_detection(las, manual())
##D 
##D # Automatic finding with manual correction
##D ttops = tree_detection(las, lmf(5))
##D ttops = tree_detection(las, manual(ttops))
## End(Not run)




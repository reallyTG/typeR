library(lidR)


### Name: $<-,LAS-method
### Title: Inherited but modified methods from sp
### Aliases: $<-,LAS-method [[<-,LAS,ANY,missing-method
###   [,LAScatalog,ANY,ANY-method [[<-,LAScatalog,ANY,ANY-method
###   $<-,LAScatalog-method

### ** Examples

## Not run: 
##D LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
##D las = readLAS(LASfile)
##D 
##D las$Z = 2L
##D las[["Z"]] = 1:10
##D las$NewCol = 0
##D las[["NewCol"]] = 0
## End(Not run)




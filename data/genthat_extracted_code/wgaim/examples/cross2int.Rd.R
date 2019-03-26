library(wgaim)


### Name: cross2int
### Title: Convert a cross genetic object to an interval object
### Aliases: cross2int
### Keywords: regression

### ** Examples


## Not run: 
##D # read in linkage map from a rotated .CSV file with "id" as the
##D # identifier for each unique row
##D 
##D wgpath <- system.file("extdata", package = "wgaim")
##D genoSxT <- read.cross("csvr", file="genoSxT.csv", genotypes=c("AA","BB"),
##D          na.strings = c("-", "NA"), dir = wgpath)
##D genoSxT <- cross2int(genoSxT, missgeno="MartinezCurnow", id = "id")
##D 
##D # plot linkage map
##D 
##D link.map(genoSxT, cex = 0.5)
##D 
## End(Not run)




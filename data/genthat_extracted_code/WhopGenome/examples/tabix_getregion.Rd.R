library(WhopGenome)


### Name: tabix_getregion
### Title: Return the currently selected region of the given tabix file.
### Aliases: tabix_getregion

### ** Examples


##
##	Example :
##
gffgzfile  <- system.file("extdata", "ex.gff3.gz", package = "WhopGenome" )
gffh <- tabix_open( gffgzfile )
gffh
tabix_setregion( gffh, "ex.1", 1, 400 )
tabix_getregion( gffh )
tabix_close( gffh )
gffh





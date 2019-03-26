library(WhopGenome)


### Name: tabix_restartregion
### Title: Reset the currently selected region to the beginning.
### Aliases: tabix_restartregion

### ** Examples


##
##	Example :
##
gffgzfile  <- system.file("extdata", "ex.gff3.gz", package = "WhopGenome" )
gffh <- tabix_open( gffgzfile )
gffh
##
##
##
tabix_setregion( gffh, "ex.1", 1, 400 )
tabix_read( gffh )
tabix_read( gffh )
tabix_restartregion( gffh )
tabix_read( gffh )
tabix_read( gffh )
tabix_close( gffh )
gffh





library(WhopGenome)


### Name: tabix_setregion
### Title: Reopen a Tabix-indexed file if the filehandle became invalid.
### Aliases: tabix_setregion

### ** Examples


##
##	Example :
##
gffgzfile  <- system.file("extdata", "ex.gff3.gz", package = "WhopGenome" )
gffh <- tabix_open( gffgzfile )
gffh
tabix_setregion( gffh, "ex.1", 1, 400 )
tabix_close( gffh )
gffh






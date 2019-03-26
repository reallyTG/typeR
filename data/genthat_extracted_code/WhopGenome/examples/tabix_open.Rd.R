library(WhopGenome)


### Name: tabix_open
### Title: Open Tabix-indexed file for subsequent access with other tabix_
###   methods
### Aliases: tabix_open

### ** Examples


##
##	Example :
##
gffgzfile  <- system.file("extdata", "ex.gff3.gz", package = "WhopGenome" )
gffh <- tabix_open( gffgzfile )
gffh
tabix_close( gffh )
gffh





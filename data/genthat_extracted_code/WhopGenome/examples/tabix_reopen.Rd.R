library(WhopGenome)


### Name: tabix_reopen
### Title: Reopen a Tabix-indexed file if the filehandle became invalid.
### Aliases: tabix_reopen

### ** Examples


##
##	Example :
##

##
##	Example :
##
gffgzfile  <- system.file("extdata", "ex.gff3.gz", package = "WhopGenome" )
gffh <- tabix_open( gffgzfile )
gffh
tabix_close( gffh )
gffh
tabix_reopen( gffh )
gffh





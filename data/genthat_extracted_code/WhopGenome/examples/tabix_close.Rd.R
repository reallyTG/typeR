library(WhopGenome)


### Name: tabix_close
### Title: Close Tabix-indexed file
### Aliases: tabix_close

### ** Examples


##
##	Example :
##
gffgzfile  <- system.file("extdata", "ex.gff3.gz", package = "WhopGenome" )
gffh <- tabix_open( gffgzfile )
gffh
tabix_close( gffh )
gffh





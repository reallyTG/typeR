library(WhopGenome)


### Name: tabix_read
### Title: Read a line from a tabix_open()'ed file
### Aliases: tabix_read tabix_readraw

### ** Examples


##
##	Example : (NOT RUN)
##

print("Opening and reading")
gffgzfile  <- system.file("extdata", "ex.gff3.gz", package = "WhopGenome" )
if( file.exists(gffgzfile) )
{
 gffgzfile
 gffh <- tabix_open( gffgzfile )
 gffh
 stopifnot( !is.null(gffh) )
 tabix_read( gffh )
 tabix_close( gffh )
 gffh
}




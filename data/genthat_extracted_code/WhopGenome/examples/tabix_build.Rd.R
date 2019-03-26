library(WhopGenome)


### Name: tabix_build
### Title: Build a tabix index file for fast access to tab-separated-value
###   formatted files.
### Aliases: tabix_build

### ** Examples


##
##	Example :
##

gfffile  <- system.file("extdata", "ex.gff3", package = "WhopGenome" )
gfffile

gffbasename <- tempfile()
file.copy( from=gfffile, to=gffbasename )
gffgzfile <- paste( sep="", gffbasename, ".gz" )
gffgzfile

##
##
gffindexfile <- paste( sep="", gffgzfile, ".tbi" )
gffindexfile
stopifnot( ! file.exists( gffindexfile ) )
print( "Index file does not exist yet!" )

###
###	compress GFF file
###
bgzf_compress( gffbasename , gffgzfile )
stopifnot( file.exists( gffgzfile ) )
###
###	build index
###
tabix_build( filename = gffgzfile,
			 sc = as.integer(1),
			 bc = as.integer(2),
			 ec = as.integer(3),
			 meta = "#",
			 lineskip = as.integer(0)
			)
# [1] TRUE
stopifnot( file.exists( gffindexfile ) )
print( "Index file has been built" )
#
gffh <- tabix_open( gffgzfile )
gffh




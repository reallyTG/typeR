library(WhopGenome)


### Name: fai_build
### Title: Build a .fai-index for the given FASTA file.
### Aliases: fai_build

### ** Examples


##
##	Example :
##
faifile  <- system.file("extdata", "ex.fasta", package = "WhopGenome")
faiindexfile <- paste( sep="", faifile, ".fai" )	# construct name of index file
file.remove( faiindexfile )				# remove existing index
fai_build( faifile )					# re-create index
stopifnot( file.exists(faiindexfile) )	# check whether index file exists
print( "All OK" )




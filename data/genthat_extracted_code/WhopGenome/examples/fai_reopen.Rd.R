library(WhopGenome)


### Name: fai_reopen
### Title: Reopen a FAIhandle that has become stale.
### Aliases: fai_reopen

### ** Examples

	##
	##	Example :
	##
	faifile  <- system.file("extdata", "ex.fasta", package = "WhopGenome")
	faifh <- fai_open( faifile )
	stopifnot( !is.null(faifh) )
	result <- fai_query4( faifh , "1", 100 , 200 )
	print( result )
	fai_close( faifh )
	fai_reopen( faifh )
	result <- fai_query4( faifh , "1", 100 , 110 )
	print( result )




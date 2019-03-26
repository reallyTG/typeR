library(WhopGenome)


### Name: fai_query4
### Title: Extract a part of a FASTA sequence.
### Aliases: fai_query4 fai_query5

### ** Examples


##
##	Example :
##
faifile  <- system.file("extdata", "ex.fasta", package = "WhopGenome")
faifh <- fai_open( faifile )
stopifnot( !is.null(faifh) )
result = fai_query4( faifh , "1", 9 , 20 )
if( result != FALSE )
{
	print( result )
}
fai_close( faifh )





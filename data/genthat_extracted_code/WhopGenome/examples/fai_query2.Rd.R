library(WhopGenome)


### Name: fai_query2
### Title: Extract a part of a FASTA sequence.
### Aliases: fai_query2 fai_query3

### ** Examples


##
##	Example :
##
faifile  <- system.file("extdata", "ex.fasta", package = "WhopGenome")
faifh <- fai_open( faifile )
stopifnot( !is.null(faifh) )
result = fai_query2( faifh , "1:100-200" )
if( result != FALSE )
{
	print( result )
}
fai_close( faifh )





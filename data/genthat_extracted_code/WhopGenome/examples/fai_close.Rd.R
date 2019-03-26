library(WhopGenome)


### Name: fai_close
### Title: Closes a file previously opened with fai_open
### Aliases: fai_close

### ** Examples


##
##	Example :
##
faifile  <- system.file("extdata", "ex.fasta", package = "WhopGenome")
faifh <- fai_open( faifile )
stopifnot( !is.null(faifh) )
fai_close( faifh )





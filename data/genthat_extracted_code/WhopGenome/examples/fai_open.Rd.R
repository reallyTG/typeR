library(WhopGenome)


### Name: fai_open
### Title: Open a faidx-indexed FASTA file
### Aliases: fai_open

### ** Examples


##
##	Example :
##
faifile  <- system.file("extdata", "ex.fasta", package = "WhopGenome")
faifh <- fai_open( faifile )
stopifnot( !is.null(faifh) )




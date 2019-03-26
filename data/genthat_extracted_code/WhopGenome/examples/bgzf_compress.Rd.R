library(WhopGenome)


### Name: bgzf_compress
### Title: Compress file with bgzip
### Aliases: bgzf_compress

### ** Examples


##
##	Example :
##
gfffile  <- system.file("data", "ex.gff3", package = "WhopGenome" )
gffgzfile <- paste( sep="", gfffile, ".gz" )
file.remove( gffgzfile )
bgzf_compress( gfffile , gffgzfile )
file.exists( gffgzfile )





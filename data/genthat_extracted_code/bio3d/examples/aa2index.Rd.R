library(bio3d)


### Name: aa2index
### Title: Convert an Aminoacid Sequence to AAIndex Values
### Aliases: aa2index
### Keywords: utilities

### ** Examples

## Residue hydropathy values
seq <- c("R","S","D","X","-","X","R","H","Q","V","L")
aa2index(seq)

## Not run: 
##D ## Use a sliding window average
##D aa2index(aa=seq, index=22, window=3)
##D 
##D ## Use an alignment
##D 
##D aln  <- read.fasta(system.file("examples/hivp_xray.fa",package="bio3d"))
##D prop <- t(apply(aln$ali, 1, aa2index, window=1))
##D 
##D ## find and use indices for volume calculations
##D i <- which(sapply(aa.index,
##D        function(x) length(grep("volume", x$D, ignore.case=TRUE)) != 0))
##D sapply(i, function(x) aa2index(aa=seq, index=x, window=5)) 
## End(Not run)




library(bio3d)


### Name: gap.inspect
### Title: Alignment Gap Summary
### Aliases: gap.inspect
### Keywords: utilities

### ** Examples

aln <- read.fasta( system.file("examples/hivp_xray.fa",
                   package = "bio3d") )

gap.stats <- gap.inspect(aln$ali)
gap.stats$row # Gaps per sequence
gap.stats$col # Gaps per position
##gap.stats$bin # Binary matrix (1 for gap, 0 for aminoacid)
##aln[,gap.stats$f.inds] # Alignment without gap positions 

plot(gap.stats$col, typ="h", ylab="No. of Gaps") 




library(seqinr)


### Name: dist.alignment
### Title: Pairwise Distances from Aligned Protein or DNA/RNA Sequences
### Aliases: dist.alignment
### Keywords: manip

### ** Examples

 myseqs <- read.alignment(file = system.file("sequences/test.mase", 
 package = "seqinr"), format = "mase")
 dist.alignment(myseqs, matrix = "identity" )
 as.matrix(dist.alignment(myseqs, matrix = "identity" ))




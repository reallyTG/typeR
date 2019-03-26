library(seqinr)


### Name: computePI
### Title: To Compute the Theoretical Isoelectric Point
### Aliases: computePI
### Keywords: manip

### ** Examples

#
# Simple sanity check with all 20 amino-acids in one-letter code alphabetical order:
#
prot <- s2c("ACDEFGHIKLMNPQRSTVWY")
stopifnot(all.equal(computePI(prot), 6.78454))
#
# Read a protein sequence in a FASTA file and then compute its pI :
#
myProts <- read.fasta(file = system.file("sequences/seqAA.fasta",
 package = "seqinr"), seqtype = "AA")
computePI(myProts[[1]]) # Should be 8.534902




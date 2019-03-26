library(seqinr)


### Name: AAstat
### Title: To Get Some Protein Statistics
### Aliases: AAstat
### Keywords: utilities

### ** Examples

  seqAA <- read.fasta(file = system.file("sequences/seqAA.fasta", package = "seqinr"),
   seqtype = "AA")
  AAstat(seqAA[[1]])




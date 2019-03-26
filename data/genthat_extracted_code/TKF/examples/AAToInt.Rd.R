library(TKF)


### Name: AAToInt
### Title: AA, DNA, RNA character set
### Aliases: AAToInt AACharacterSet AAGapCharacterSet
###   AmbiguousAACharacterSet AmbiguousAAGapCharacterSet DNACharacterSet
###   DNAGapCharacterSet RNACharacterSet RNAGapCharacterSet
### Keywords: ~kwd1 ~kwd2

### ** Examples

  library(seqinr)
  fasta <- read.fasta(file.path(system.file("extdata", package="TKF"),
                      "pair1.fasta"),
                      seqtype="AA", set.attributes=FALSE)
  AAToInt(fasta[[1]])
  
  AACharacterSet  




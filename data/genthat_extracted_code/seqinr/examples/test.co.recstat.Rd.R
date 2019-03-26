library(seqinr)


### Name: test.co.recstat
### Title: Tests if regions located between Stop codons contain putative
###   CDSs.
### Aliases: test.co.recstat
### Keywords: sequence correspondence analysis

### ** Examples

ff <- system.file("sequences/ECOUNC.fsa", package = "seqinr")
seq <- read.fasta(ff)
rec <- recstat(seq[[1]], seqname = getName(seq))
test.co.recstat(rec)




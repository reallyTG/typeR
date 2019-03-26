library(seqinr)


### Name: test.li.recstat
### Title: Tests if regions located between Stop codons contain putative
###   CDSs.
### Aliases: test.li.recstat
### Keywords: sequence correspondence analysis

### ** Examples

ff <- system.file("sequences/ECOUNC.fsa", package = "seqinr")
seq <- read.fasta(ff)
rec <- recstat(seq[[1]], seqname = getName(seq))
test.li.recstat(rec)




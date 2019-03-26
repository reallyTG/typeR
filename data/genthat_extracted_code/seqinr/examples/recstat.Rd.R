library(seqinr)


### Name: recstat
### Title: Prediction of Coding DNA Sequences.
### Aliases: recstat
### Keywords: correspondence analysis sequence

### ** Examples

ff <- system.file("sequences/ECOUNC.fsa", package = "seqinr")
seq <- read.fasta(ff)
rec <- recstat(seq[[1]], seqname = getName(seq))




library(seqinr)


### Name: draw.recstat
### Title: Graphical representation of a recstat analysis.
### Aliases: draw.recstat
### Keywords: correspondence analysis sequence

### ** Examples

ff <- system.file("sequences/ECOUNC.fsa", package = "seqinr")
seq <- read.fasta(ff)
rec <- recstat(seq[[1]], seqname = getName(seq))
draw.recstat(rec)




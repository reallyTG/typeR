library(seqinr)


### Name: SeqFastaAA
### Title: AA sequence in Fasta Format
### Aliases: SeqFastaAA is.SeqFastaAA as.SeqFastaAA summary.SeqFastaAA
### Keywords: utilities

### ** Examples

  s <- read.fasta(file = system.file("sequences/seqAA.fasta", package = "seqinr"), seqtype="AA")
  is.SeqFastaAA(s[[1]])
  summary(s[[1]])
  myseq <- s2c("MSPTAYRRGSPAFLV*")
  as.SeqFastaAA(myseq, name = "myseq", Annot = "blablabla")
  myseq




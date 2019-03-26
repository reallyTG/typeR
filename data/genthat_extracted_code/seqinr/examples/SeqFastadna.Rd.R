library(seqinr)


### Name: SeqFastadna
### Title: Class for DNA sequence in Fasta Format
### Aliases: SeqFastadna is.SeqFastadna as.SeqFastadna summary.SeqFastadna
### Keywords: utilities

### ** Examples

 s <- read.fasta(system.file("sequences/malM.fasta",package="seqinr"))
 is.SeqFastadna(s[[1]])
 summary(s[[1]])
 myseq <- s2c("acgttgatgctagctagcatcgat")
 as.SeqFastadna(myseq, name = "myseq", Annot = "blablabla")
 myseq




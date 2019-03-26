library(phylotools)


### Name: rm.sequence.fasta
### Title: Delete sequences from fasta file
### Aliases: rm.sequence.fasta
### Keywords: fasta

### ** Examples


cat(
">seq_1",  "---TCCGCCCCCCTACTCTA",
">seq_3",  "CTCTCCGCCCCTCTACTCTA",
">seq_5",  "---TCCGCCC-TTTACTCTA",
">seq_6",  "---TCCGCCCCTCTACTCTA",
">seq_9",  "---TCCGCCC-TCTACTCTA",
">seq_12", "CTCTCCGCCC-TCTACTCTA",
file = "trn2.fasta", sep = "\n")

rm.sequence.fasta(infile = "trn2.fasta", to.rm = c("seq_1","seq_12"))

unlink("trn2.fasta")
unlink("sequence.removed.fasta")




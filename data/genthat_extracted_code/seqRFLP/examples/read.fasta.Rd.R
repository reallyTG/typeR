library(seqRFLP)


### Name: read.fasta
### Title: Read fasta file
### Aliases: read.fasta
### Keywords: fasta read

### ** Examples


### read.fasta() example
### 
cat(
">No305",
"NTTCGAAAAACACACCCACTACTAAAANTTATCAGTCACT",
file = "dna1.fas", sep = "\n")

sequences <- read.fasta("dna1.fas")

unlink("dna1.fas")





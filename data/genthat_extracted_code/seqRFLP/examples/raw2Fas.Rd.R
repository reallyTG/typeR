library(seqRFLP)


### Name: raw2Fas
### Title: Read and converting raw DNA files to fasta format.
### Aliases: raw2Fas
### Keywords: fasta read concatenate

### ** Examples


#########
######
### raw2Fas() example
cat(
">No305",
"NTTCGAAAAACACACCCACTACTAAAANTTATCAGTCACT",
file = "dna1.fas", sep = "\n")
cat(
">No304",
"ATTCGAAAAACACACCCACTACTAAAAATTATCAACCACT",
file = "dna2.fas", sep = "\n")
cat(
">No305",
"NTTCGAAAAACACACCCACTACTAAAANTTATCAGTCACT",
file = "dna3.fas", sep = "\n")

raw2Fas(getwd(), appendix = ".fas")

unlink("dna1.fas")
unlink("dna2.fas")
unlink("dna3.fas")





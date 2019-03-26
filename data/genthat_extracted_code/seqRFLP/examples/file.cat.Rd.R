library(seqRFLP)


### Name: file.cat
### Title: Copy or concatenate files to one.
### Aliases: file.cat
### Keywords: cat

### ** Examples


#### file.cat() example
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

file.cat(dir = getwd(), appendix = ".fas", file = "total")

unlink("dna1.fas")
unlink("dna2.fas")
unlink("dna3.fas")
unlink("total.fas")





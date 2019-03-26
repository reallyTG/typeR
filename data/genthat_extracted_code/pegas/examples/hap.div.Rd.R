library(pegas)


### Name: hap.div
### Title: Haplotype Diversity
### Aliases: hap.div hap.div.haplotype hap.div.DNAbin
### Keywords: manip

### ** Examples

data(woodmouse)
hap.div(woodmouse) # all haplotypes are unique

## neuraminidase sequences from the 2009 H1N1 data (delivered with adegenet):
fl <- system.file("files/pdH1N1-NA.fasta", package = "adegenet")
H1N1.NA <- read.dna(fl, "fasta")
hap.div(H1N1.NA, TRUE)




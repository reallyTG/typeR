library(protr)


### Name: extractCTriadClass
### Title: Conjoint Triad Descriptor (with customized amino acid
###   classification support)
### Aliases: extractCTriadClass
### Keywords: Conjoint Triad extract

### ** Examples

x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]

# use customized amino acid classification (normalized van der Waals volume)
newclass = list(
  c("G", "A", "S", "T", "P", "D", "C"),
  c("N", "V", "E", "Q", "I", "L"),
  c("M", "H", "K", "F", "R", "Y", "W"))

extractCTriadClass(x, aaclass = newclass)




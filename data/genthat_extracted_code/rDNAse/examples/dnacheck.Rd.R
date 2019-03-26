library(rDNAse)


### Name: dnacheck
### Title: Check if the DNA sequence are in the 4 default types
### Aliases: dnacheck
### Keywords: check

### ** Examples

x = 'GACTGAACTGCACTTTGGTTTCATATTATTTGCTC'
dnacheck(x) # TRUE
dnacheck(paste(x, 'Z', sep = '')) # FALSE




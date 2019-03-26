library(protr)


### Name: protseg
### Title: Protein Sequence Segmentation/Partition
### Aliases: protseg
### Keywords: segmentation

### ** Examples

x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
protseg(x, aa = "R", k = 5)




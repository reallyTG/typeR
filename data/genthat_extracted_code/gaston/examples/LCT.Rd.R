library(gaston)


### Name: LCT
### Title: LCT data set
### Aliases: LCT LCT.gen LCT.fam LCT.bim LCT.pop
### Keywords: datasets

### ** Examples

data(LCT)
x <- as.bed.matrix(LCT.gen, LCT.fam, LCT.bim)
x
which(x@snps$id == "rs4988235")




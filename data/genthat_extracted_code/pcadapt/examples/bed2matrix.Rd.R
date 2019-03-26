library(pcadapt)


### Name: bed2matrix
### Title: Convert a bed to a matrix
### Aliases: bed2matrix

### ** Examples

bedfile <- system.file("extdata", "geno3pops.bed", package = "pcadapt")
mat <- bed2matrix(bedfile)
dim(mat)
table(mat)




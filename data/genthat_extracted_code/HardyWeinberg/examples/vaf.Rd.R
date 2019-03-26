library(HardyWeinberg)


### Name: vaf
### Title: Computes the sample variance of the allele frequency for a
###   biallelic marker.
### Aliases: vaf
### Keywords: misc

### ** Examples

x <- c(MM=298,MN=489,NN=213)
pA <- af(x)
vA <- vaf(x)
cat("allele frequency:",pA,"\n")
cat("sample variance allele frequency:",vA,"\n")




library(RFGLS)


### Name: geno
### Title: Simulated genotypic dataset
### Aliases: geno
### Keywords: datasets

### ** Examples

data(geno)
str(data.frame(t(geno)))
round(cor(t(geno)),3)  ##<--SNPs are on different chromosomes, so no LD.
##Also see examples for functions fgls(), gls.batch(), and gls.batch.get().




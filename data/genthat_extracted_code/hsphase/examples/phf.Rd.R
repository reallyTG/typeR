library(hsphase)


### Name: phf
### Title: Half-Sib Family Phasing
### Aliases: phf
### Keywords: snp phase haplotype inference reconstruction

### ** Examples

genotype <- matrix(c(
  2,1,0,
  2,0,0,
  0,0,2), byrow = TRUE, ncol = 3)
block <- bmh(genotype)
phf(genotype, block, ssp(block, genotype))




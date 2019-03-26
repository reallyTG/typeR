library(hsphase)


### Name: aio
### Title: All-in-one Phasing
### Aliases: aio
### Keywords: snp phase haplotype inference reconstruction

### ** Examples

genotype <- matrix(c(       # Define a Half-sib Genotype Matrix
  2,1,0,                    # Individual 1
  2,0,0,                    # Individual 2
  0,0,2                     # Individual 3
  ), byrow = TRUE, ncol = 3)    # There are 3 individulas with three SNPs
  
aio(genotype)               # The genotypes must include only one half-sib family and one chromosome




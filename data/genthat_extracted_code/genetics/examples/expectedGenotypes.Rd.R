library(genetics)


### Name: expectedGenotypes
### Title: Construct expected genotypes/haplotypes according to known
###   allele variants
### Aliases: expectedGenotypes expectedHaplotypes
### Keywords: manip

### ** Examples

  ## On genotype
  prp <- c("ARQ/ARQ", "ARQ/ARQ", "ARR/ARQ", "AHQ/ARQ", "ARQ/ARQ")
  alleles <- c("ARR", "AHQ", "ARH", "ARQ", "VRR", "VRQ")
  expectedGenotypes(as.genotype(prp))
  expectedGenotypes(as.genotype(prp, alleles=alleles))
  expectedGenotypes(as.genotype(prp, alleles=alleles, reorder="yes"))

  ## Only allele names
  expectedGenotypes(alleles=alleles)
  expectedGenotypes(alleles=alleles, ploidy=4)

  ## Haplotype
  expectedHaplotypes(alleles=alleles)
  expectedHaplotypes(alleles=alleles, ploidy=4)[1:20]




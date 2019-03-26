library(HapEstXXR)


### Name: itegeppXXR
### Title: Haplotype estimation routine for single individual data
### Aliases: itegeppXXR

### ** Examples

  set.seed(123456)
  ns <- 4  # Number of SNPs
  N <- 2000   # Number of individuals
  patid <- N:1
  geno <- matrix(sample(c(1, 2, 3), ns * N, replace = TRUE), ncol = ns)
  iteHAP <- itegeppXXR(geno, des = 1, lim = 0.01)




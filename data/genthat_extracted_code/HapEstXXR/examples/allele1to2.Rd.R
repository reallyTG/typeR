library(HapEstXXR)


### Name: allele1to2
### Title: Convert genotype matrix from two different types
### Aliases: allele1to2 allele2to1 alleleRto1 alleleRto2 allele1toR
###   allele2toR
### Keywords: convert

### ** Examples

 ## [A] allele1to2
 N <- 10
 ns <- 4
 (geno <- matrix(sample(c(NA, 0:2), N * ns, replace = TRUE), nc = ns))
 allele1to2(geno)

 ## [B] allele2to1
 (geno <- matrix(c(0, 0, 1, 1, 2, 1, 1, 2,
                   1, 1, 2, 2, 2, 2, 1, 2,
                   0, 0, 1, 1, 2, 1, 0, 0), nc = 4, byrow = TRUE))
 allele2to1(geno)

 ## [C] alleleRto1
 N <- 10
 ns <- 4
 (geno <- matrix(sample(c(NA, 1:3), N * ns, replace = TRUE), nc = ns))
 alleleRto1(geno)

 ## [D] alleleRto2
 N <- 10
 ns <- 4
 (geno <- matrix(sample(c(0, 1:3), N * ns, replace = TRUE), nc = ns))
 alleleRto2(geno)

 ## [E] allele1toR
 N <- 10
 ns <- 4
 (geno <- matrix(sample(c(NA, 0:2), N * ns, replace = TRUE), nc = ns))
 allele1toR(geno)

 ## [F] allele2toR
 (geno <- matrix(c(0, 0, 1, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2, 2, 1, 2, 
                   0, 0, 1, 1, 2, 1, 0, 0),
     nc = 4, byrow = TRUE))
 allele2toR (geno)




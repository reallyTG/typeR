library(hsphase)


### Name: ssp
### Title: Sire Imputation and Phasing
### Aliases: ssp
### Keywords: snp halfsib phase

### ** Examples

genotype <- matrix(c(
0,2,1,1,1,
2,0,1,2,2,
2,2,1,0,2,
2,2,1,1,1,
0,0,2,1,0), ncol = 5, byrow = TRUE) # each row contains the SNP of individuals

(result <- ssp(bmh(genotype), genotype)) 




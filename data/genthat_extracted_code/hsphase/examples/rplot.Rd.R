library(hsphase)


### Name: rplot
### Title: Recombination Plot
### Aliases: rplot
### Keywords: snp halfsib phase recombination

### ** Examples

genotype <- matrix(c(
0,2,0,1,0,
2,0,1,2,2,
2,2,1,0,2,
2,2,1,1,1,
0,0,2,1,0), ncol = 5, byrow = TRUE) # each row contains the SNP of individuals

rplot(genotype, c(1,2,3,4,8)) 




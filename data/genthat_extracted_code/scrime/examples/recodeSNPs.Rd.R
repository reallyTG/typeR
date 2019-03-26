library(scrime)


### Name: recodeSNPs
### Title: Recoding of SNP Values
### Aliases: recodeSNPs
### Keywords: manip array

### ** Examples
## Not run: 
##D # Generate an example data set consisting of 5 rows and 12 columns,
##D # where it is assumed that each row corresponds to a SNP.
##D 
##D mat <- matrix("", 10, 12)
##D mat[c(1, 4, 6),] <- sample(c("AA", "AT", "TT"), 18, TRUE)
##D mat[c(2, 3, 10),] <- sample(c("CC", "CG", "GG"), 18, TRUE)
##D mat[c(5, 8),] <- sample(c("GG", "GT", "TT"), 12, TRUE)
##D mat[c(7, 9),] <- sample(c("AA", "AC", "CC"), 12, TRUE)
##D mat
##D 
##D # Recode the SNPs
##D 
##D recodeSNPs(mat)
##D 
##D # Recode the SNPs by assuming that the first letter in
##D # the heterogyzous genotype refers to the major allele.
##D 
##D recodeSNPs(mat, first.ref = TRUE)
##D 
## End(Not run)



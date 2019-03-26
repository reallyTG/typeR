library(scrime)


### Name: snp2bin
### Title: Transformation of SNPs to Binary Variables
### Aliases: snp2bin
### Keywords: array manip

### ** Examples
## Not run: 
##D # Generate an example data set consisting of 10 rows (observations)
##D # and 5 columns (SNPs).
##D 
##D mat <- matrix(sample(3, 50, TRUE), 10)
##D colnames(mat) <- paste("SNP", 1:5, sep = "")
##D 
##D # Transform each SNP into two dummy variables, one that codes for
##D # a recessive effect and one that codes for a dominant effect.
##D 
##D snp2bin(mat)
##D 
##D # Transform each SNP into three dummy variables, where each of
##D # these variables codes for one of the three genotypes.
##D 
##D snp2bin(mat, domrec = FALSE)
## End(Not run)



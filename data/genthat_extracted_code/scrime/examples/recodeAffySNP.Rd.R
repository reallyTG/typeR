library(scrime)


### Name: recodeAffySNP
### Title: Recoding of Affymetrix SNP Values
### Aliases: recodeAffySNP
### Keywords: manip array

### ** Examples
## Not run: 
##D # Generate a sample data set consisting of 10 rows and 12 columns,
##D # and randomly replace 5 of the values by "NN".
##D 
##D mat <- matrix("", 10, 12)
##D mat[1:5,] <- sample(c("AA", "AB", "BB"), 60, TRUE,
##D    prob = c(0.49, 0.42, 0.09))
##D mat[6:10,] <- sample(c("AA", "AB", "BB"), 60, TRUE,
##D    prob = c(0.09, 0.42, 0.49))
##D mat[sample(120, 5)] <- "NN"
##D mat
##D 
##D # Recode the SNPs.
##D 
##D recodeAffySNP(mat)
##D 
##D # Recode the SNPs assuming that "A" is always the major allele.
##D 
##D recodeAffySNP(mat, refAA = TRUE)
##D 
## End(Not run)



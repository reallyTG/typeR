library(AssotesteR)


### Name: SKAT
### Title: SKAT: Sequence Kernel Association Test
### Aliases: SKAT

### ** Examples

  ## Not run: 
##D    
##D   # load data genodata
##D   data(genodata)
##D 
##D   # phenotype (first column of genodata)
##D   pheno = genodata[,1]
##D 
##D   # genotype (rest of columns of genodata)
##D   geno = genodata[,-1]
##D 
##D   # apply SKAT with linear kernel 
##D   myskat.linear = SKAT(pheno, geno, kernel="linear")
##D   myskat.linear
##D 
##D   # apply SKAT with weighted linear kernel
##D   # weights estimated from distribution beta(MAF, a=1, b=25)
##D   myskat.wlinear = SKAT(pheno, geno, kernel="wlinear", a=1, b=25)
##D   myskat.wlinear
##D 
##D   # apply SKAT with quadratic kernel
##D   myskat.quad = SKAT(pheno, geno, kernel="quadratic")
##D   myskat.quad
##D 
##D   # apply SKAT with IBS kernel
##D   myskat.ibs = SKAT(pheno, geno, kernel="IBS")
##D   myskat.ibs
##D   
## End(Not run)




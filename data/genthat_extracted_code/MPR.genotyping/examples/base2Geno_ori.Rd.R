library(MPR.genotyping)


### Name: base2Geno_ori
### Title: Formatting the Matrix of SNP to Int Type(NA)
### Aliases: base2Geno_ori
### Keywords: formatting

### ** Examples

base=matrix(c("A",NA,"G",
		NA,"T","A",
		"C","G",NA),3,3,byrow=TRUE)
allele=matrix(c("A","G",
			"T","A",
			"C","G"),3,2,byrow=TRUE)
base2Geno_ori(base,allele)




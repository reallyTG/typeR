library(MPR.genotyping)


### Name: base2Geno
### Title: Formatting the Matrix of SNP to Int Type
### Aliases: base2Geno
### Keywords: formatting

### ** Examples

base=matrix(c("A",NA,"G",
		NA,"T","A",
		"C","G",NA),3,3,byrow=TRUE)
allele=matrix(c("A","G",
			"T","A",
			"C","G"),3,2,byrow=TRUE)
base2Geno(base,allele)




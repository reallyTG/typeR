library(gaston)


### Name: SNP.rm.duplicates
### Title: Remove duplicated SNPs
### Aliases: SNP.rm.duplicates

### ** Examples

# Use example data of 10 individuals with 7 duplicated SNPs
data(dupli)
x <- as.bed.matrix(dupli.gen, fam = dupli.ped, bim = dupli.bim)

# There are any duplicated positions:
dupli.bim

x1 <- SNP.rm.duplicates(x)
# By default (na.keep = TRUE), as soon as the genotype is missing
# in one of the SNPs it is set to missing 
# (here looking at duplicated SNPs 2a and 2b)
as.matrix(x[,2:3])
as.matrix(x1[,2])

# With na.keep = FALSE 
x2 <- SNP.rm.duplicates(x, na.keep = FALSE)
as.matrix(x2[,2])

# Let's examinate SNP 3.a and 3.b (swapped alleles)
as.matrix(x[,4:5])
as.matrix(x1[,3])
as.matrix(x2[,3])

# and so on... (see also ?dupli)




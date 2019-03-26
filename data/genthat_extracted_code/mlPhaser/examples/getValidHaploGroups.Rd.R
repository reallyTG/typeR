library(mlPhaser)


### Name: getValidHaploGroups
### Title: Get haplo groups for a genotype
### Aliases: getValidHaploGroups

### ** Examples

# create a data frame to store alleles of haplotypes. Columns are loci.
haplotypes <- data.frame(	A= c("a","b","c","a","b","c","b"),
					B= c("a","b","c","b","c","a","a"),
					C= c("a","b","c","b","c","a","a") )
# give the haplotypes sensible names as rownames.
rownames(haplotypes) <- apply(haplotypes, 1, paste,sep="" , collapse="")
# load a genotype as a table
thisGenotype <- data.frame(A.1="a", A.2="b", B.1="a", B.2="b",C.1="a", C.2="b")
# find groups of haplotypes as a list of lists
my.valid.groups <- getValidHaploGroups(thisGenotype,haplotypes)
# look at the list structure of the valid groups list
str(my.valid.groups)
# see phaseReport() for more friendly function




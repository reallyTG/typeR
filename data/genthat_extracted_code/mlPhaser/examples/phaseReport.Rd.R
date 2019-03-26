library(mlPhaser)


### Name: phaseReport
### Title: Best/all hapltype groups for a genotype
### Aliases: phaseReport

### ** Examples

# create a data frame to store alleles of haplotypes. Columns are loci.
haplotypes <- data.frame(	A= c("a","b","c","a","b","c","b"),
					B= c("a","b","c","b","c","a","a"),
					C= c("a","b","c","b","c","a","a") )
# give the haplotypes sensible names as rownames.
rownames(haplotypes) <- apply(haplotypes, 1, paste,sep="" , collapse="")
# Create a named vector of haplotype frequencies.
haploFreqs <- c(0.4, 0.3, 0.15, 0.07,0.05, 0.02, 0.01)
names(haploFreqs) <- rownames(haplotypes)
# load a genotype as a table
thisGenotype <- data.frame(A.1="a", A.2="b", B.1="a", B.2="b",C.1="a", C.2="b")
phaseReport(thisGenotype,haplotypes)
# use haplotype frequencies to rank candidate haplotype groups.
phaseReport(thisGenotype,haplotypes, haploFreqs)
# return only the best haplotype group for each genotype.
phaseReport(thisGenotype,haplotypes, haploFreqs, outFormat="top")

# simulate a set of genootypes
my.genotypes <- simGenoFromHaplo(haploTable=haplotypes, haploFreqs=haploFreqs , n=20, ploidy=2)
# get phase report on all genotypes
phaseReport(my.genotypes,haplotypes, haploFreqs, outFormat="all")	# outFormat="all" is the default
phaseReport(my.genotypes,haplotypes, haploFreqs, outFormat="top")




library(gpmap)


### Name: enumerate_genotypes
### Title: Function for enumerating genotypes for N biallelic loci
### Aliases: enumerate_genotypes

### ** Examples

#genotypes for a single locus
enumerate_genotypes()

#genotypes for two loci "A" and "B", with alleles named "H" and "L"
enumerate_genotypes(2,c("A","B"),c("H","L"))

#genotypes for the two-locus example in Cheverud & Routman (1995)
enumerate_genotypes(2,c("D7Mit17","D1Mit7"),rbind(c('A1','A2'),c('B1','B2')))




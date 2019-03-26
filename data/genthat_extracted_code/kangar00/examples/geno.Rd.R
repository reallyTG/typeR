library(kangar00)


### Name: geno
### Title: Example genotypes for 50 individuals.
### Aliases: geno
### Keywords: datasets

### ** Examples

data(geno)
head(geno)
# create gwas object
data(pheno)
data(anno)
gwas <- new('GWASdata', pheno=pheno, geno=geno, anno=anno, desc="some study") 




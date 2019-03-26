library(kangar00)


### Name: pheno
### Title: Example phenotype file for 50 individuals.
### Aliases: pheno
### Keywords: datasets

### ** Examples

data(pheno)
head(pheno)
# create gwas object
data(geno)
data(anno)
gwas <- new('GWASdata', pheno=pheno, geno=geno, anno=anno, desc="some study") 




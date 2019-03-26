library(kangar00)


### Name: gwas
### Title: Example 'GWASdata' object.
### Aliases: gwas
### Keywords: datasets

### ** Examples

# create gwas object
data(pheno)
data(geno)
data(anno)
gwas <- new('GWASdata', pheno=pheno, geno=geno, anno=anno, desc="some study") 




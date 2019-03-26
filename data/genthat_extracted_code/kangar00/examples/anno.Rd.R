library(kangar00)


### Name: anno
### Title: Example annotation file for three pathways.
### Aliases: anno
### Keywords: datasets

### ** Examples

data(anno)
head(anno)
# create gwas object
data(pheno)
data(geno)
gwas <- new('GWASdata', pheno=pheno, geno=geno, anno=anno, desc="some study") 




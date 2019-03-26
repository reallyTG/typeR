library(kangar00)


### Name: GWASdata
### Title: S4 class for an object representing a Genome-wide Assocaition
###   Study.
### Aliases: GWASdata GWASdata,ANY-method show,GWASdata-method
###   summary,GWASdata-method GeneSNPsize,GWASdata-method GeneSNPsize

### ** Examples

# create gwas data object
data(pheno)
data(geno)
data(anno)
gwas <- new('GWASdata', pheno=pheno, geno=geno, anno=anno, desc="some study") 
# show and summary methods
gwas
summary(gwas)
# SNPs and genes in pathway
GeneSNPsize(gwas)




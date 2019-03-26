library(kangar00)


### Name: lowrank_kernel-class
### Title: An S4 class to represent a low-rank kernel for a SNPset at
###   specified knots
### Aliases: lowrank_kernel-class lowrank_kernel

### ** Examples

data(gwas)
data(hsa04020)
square <- calc_kernel(gwas, hsa04020, knots=gwas, type='lin', calculation='cpu')
dim(square@kernel)

gwas2 <- new('GWASdata', pheno=pheno[1:10,], geno=geno[1:10,], anno=anno, desc="study 2")
low_rank <- calc_kernel(gwas, hsa04020, knots = gwas2, type='net', calculation='cpu')
dim(low_rank@kernel)




library(LDtests)


### Name: LDtests-package
### Title: Exact tests for Linkage Disequilibrium and Hardy-Weinberg
###   Equilibrium
### Aliases: LDtests-package LDtests
### Keywords: htest

### ** Examples

ctable <- c(4,5,1,20)
LD2sided.tables(ctable)
LD2sided.pvals(ctable)$pval.Fish
Fisher1sided(ctable)$pval.Fish 
HWE2sided.table(maf=0.17,n=100)
geno <- c(20,73,7)
HWE2sided(geno)




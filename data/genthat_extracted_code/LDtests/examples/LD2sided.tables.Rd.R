library(LDtests)


### Name: LD2sided.tables
### Title: Tables of p-values and Linkage Disequilibrium measures for all
###   2x2 tables possible under the null distribution.
### Aliases: LD2sided.tables
### Keywords: htest

### ** Examples

ctable <- c(0,9,5,16)
LD2sided.tables(ctable)
LD2sided.pvals(ctable)$pval.Fish




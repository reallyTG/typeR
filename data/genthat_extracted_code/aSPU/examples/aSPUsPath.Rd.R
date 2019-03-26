library(aSPU)


### Name: aSPUsPath
### Title: Pathway based Sum of Powered Score tests (SPUsPath) and adaptive
###   SPUpath (aSPUsPath) test for single trait - pathway association with
###   GWAS summary statistics.
### Aliases: aSPUsPath

### ** Examples

data(kegg9)

# p-values of SPUpath and aSPUpath tests.
out.a <- aSPUsPath(kegg9$nP, corSNP = kegg9$ldmatrix, pow=c(1:8, Inf),
                  pow2 = c(1,2,4,8), 
                  snp.info=kegg9$snp.info, gene.info = kegg9$gene.info,
                  n.perm=5, Ps = TRUE)

out.a





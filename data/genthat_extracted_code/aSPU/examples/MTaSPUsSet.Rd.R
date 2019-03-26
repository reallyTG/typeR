library(aSPU)


### Name: MTaSPUsSet
### Title: gene-Multitrait Sum of Powered Score (MTSPUsSet) tests and
###   adaptive MTSPUsSet (MTaSPUsSet) test for multi trait - SNP set
###   association with GWAS summary statistics.
### Aliases: MTaSPUsSet

### ** Examples


data(SAMD11)
attach(SAMD11)
## example analysis using MTaSPUsSet test.
(outFZ <- MTaSPUsSet(ZsF, corSNP=corSNPF, corPhe = corPheF,
      pow=c(1,2,4,8),  pow2 = c(1,2,4,8), n.perm=10, Ps=FALSE))






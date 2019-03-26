library(aSPU)


### Name: MTaSPUsSetScore
### Title: gene-Multitrait Sum of Powered Score (MTSPUsSetScore) tests and
###   adaptive MTSPUsSet (MTaSPUsSet) test for multi trait - SNP set
###   association with GWAS summary statistics. (Score version added)
### Aliases: MTaSPUsSetScore

### ** Examples


data(SAMD11)
attach(SAMD11)
## example analysis using aSPUM test.
(outFZ <- MTaSPUsSetScore(ZsF, corSNP=corSNPF, corPhe = corPheF,
      pow=c(1,2,4,8),  pow2 = c(1,2,4,8), n.perm=10, Ps=FALSE))






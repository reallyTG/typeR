library(mergedblocks)


### Name: mergedblocksmulti
### Title: Merged block randomization for multiple strata
### Aliases: mergedblocksmulti

### ** Examples

#Four strata, randomize 20 patients for each stratum, 1:1 allocation,
#with labels "0" and "1".
mergedblocksmulti(K = 4, n = 20)

#Three strata, randomize 30, 40 and 50 patients for each stratum,
#1:2 allocation, with labels "placebo" and "treatment".
mergedblocksmulti(K = 3, n = c(30, 40, 50), ratio = c(1, 2), labels = c("placebo", "treatment"))





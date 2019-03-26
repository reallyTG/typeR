library(fishmethods)


### Name: clus.str.lf
### Title: Statistical Comparison of Length Frequencies from Stratified
###   Random Cluster Sampling
### Aliases: clus.str.lf
### Keywords: htest misc

### ** Examples

data(codstrcluslen)
clus.str.lf(
group=codstrcluslen$region,strata=codstrcluslen$stratum,
 weights=codstrcluslen$weights,haul=codstrcluslen$tow,
 len=codstrcluslen$length,number=codstrcluslen$number,
 binsize=5,resamples=100)




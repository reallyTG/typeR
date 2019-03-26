library(fishmethods)


### Name: clus.lf
### Title: Statistical Comparison of Length Frequencies from Simple Random
###   Cluster Sampling
### Aliases: clus.lf
### Keywords: misc

### ** Examples

data(codcluslen)
clus.lf(group=codcluslen$region,haul=c(paste("ST-",codcluslen$tow,sep="")),
 len=codcluslen$length, number=codcluslen$number, 
 binsize=5,resamples=100)




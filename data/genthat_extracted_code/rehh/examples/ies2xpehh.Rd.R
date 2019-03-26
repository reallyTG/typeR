library(rehh)


### Name: ies2xpehh
### Title: Compute xpEHH (standardized ratio of iES from two populations)
###   as described in Sabeti et al. (2007)
### Aliases: ies2xpehh

### ** Examples

data(wgscan.cgu) ; data(wgscan.eut) 
## results from a genome scan (44,057 SNPs)
##see ?wgscan.eut and ?wgscan.cgu for details
xpehh<-ies2xpehh(wgscan.cgu,wgscan.eut,"CGU","EUT")




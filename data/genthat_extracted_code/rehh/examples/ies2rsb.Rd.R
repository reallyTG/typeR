library(rehh)


### Name: ies2rsb
### Title: Compute Rsb (standardized ratio of iES from two populations)
### Aliases: ies2rsb

### ** Examples

data(wgscan.cgu) ; data(wgscan.eut) 
## results from a genome scan (44,057 SNPs)
##see ?wgscan.eut and ?wgscan.cgu for details
res.rsb<-ies2rsb(wgscan.cgu,wgscan.eut,"CGU","EUT")




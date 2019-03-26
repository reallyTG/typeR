library(SNPassoc)


### Name: getSignificantSNPs
### Title: Extract significant SNPs from an object of class 'WGassociation'
### Aliases: getSignificantSNPs
### Keywords: utilities

### ** Examples

data(HapMap)
# resHapMap contains the results for a log-additive genetic model

# to get the significant SNPs for chromosome 12
getSignificantSNPs(resHapMap,chromosome=12)
# to get the significant SNPs for chromosome 5
getSignificantSNPs(resHapMap,5)
# to get the significant SNPs for chromosome X at level 1e-8
getSignificantSNPs(resHapMap,5,sig=1e-8)





library(hapassoc)


### Name: pre.hapassoc
### Title: Pre-process the data before fitting it with hapassoc
### Aliases: pre.hapassoc
### Keywords: methods

### ** Examples

#First example data set has single-locus genotypes in "allelic format"
data(hypoDat)
example.pre.hapassoc<-pre.hapassoc(hypoDat, numSNPs=3)

# To get the initial haplotype frequencies:
example.pre.hapassoc$initFreq
#      h000       h001       h010       h011       h100       h101       h110 
#0.25179111 0.26050418 0.23606001 0.09164470 0.10133627 0.02636844 0.01081260 
#      h111 
#0.02148268 
# The '001' haplotype is estimated to be the most frequent

example.pre.hapassoc$pooledHaplos
# "h101" "h110" "h111"
# These haplotypes are to be pooled in the design matrix for the risk model

names(example.pre.hapassoc$haploDM)
# "h000"   "h001"   "h010"   "h011"   "h100"   "pooled"

####
#Second example data set has single-locus genotypes in "genotypic format"
data(hypoDatGeno)
example2.pre.hapassoc<-pre.hapassoc(hypoDatGeno, numSNPs=3, allelic=FALSE)

# To get the initial haplotype frequencies:
example2.pre.hapassoc$initFreq
#      hAAA       hAAC       hACA       hACC       hCAA       hCAC
#0.25179111 0.26050418 0.23606001 0.09164470 0.10133627 0.02636844
#      hCCA           hCCC 
#0.01081260	0.02148268 
# The 'hAAC' haplotype is estimated to be the most frequent

example2.pre.hapassoc$pooledHaplos
#  "hCAC" "hCCA" "hCCC"
# These haplotypes are to be pooled in the design matrix for the risk model

names(example2.pre.hapassoc$haploDM)
#  "hAAA"   "hAAC"   "hACA"   "hACC"   "hCAA"   "pooled"




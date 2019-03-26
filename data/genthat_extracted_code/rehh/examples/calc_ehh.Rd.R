library(rehh)


### Name: calc_ehh
### Title: EHH and iHH computations at a given core SNP
### Aliases: calc_ehh

### ** Examples

#example haplohh object (280 haplotypes, 1424 SNPs)
#see ?haplohh_cgu_bta12 for details
data(haplohh_cgu_bta12) 

#computing EHH statisitics for the focal SNP at position 456
# which displays a strong signal of selection
res.ehh<-calc_ehh(haplohh_cgu_bta12,mrk=456)




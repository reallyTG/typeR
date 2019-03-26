library(rehh)


### Name: calc_ehhs
### Title: EHHS and iES computations at a given core SNP
### Aliases: calc_ehhs

### ** Examples

#example haplohh object (280 haplotypes, 1424 SNPs)
#see ?haplohh_cgu_bta12 for details
data(haplohh_cgu_bta12) 
#computing EHH statistics for the focal SNP at position 456
#which displays a strong signal of selection
res.ehhs<-calc_ehhs(haplohh_cgu_bta12,mrk=456)




library(rehh)


### Name: bifurcation.diagram
### Title: plot of an haplotype bifurcation diagram
### Aliases: bifurcation.diagram

### ** Examples

#example haplohh object (280 haplotypes, 1424 SNPs)
#see ?haplohh_cgu_bta12 for details
data(haplohh_cgu_bta12) 
#plotting bifurcation diagram for both ancestral and derived allele
#from the focal SNP at position 456
#which display a strong signal of selection
layout(matrix(1:2,2,1))
#ancestral allele
bifurcation.diagram(haplohh_cgu_bta12,mrk_foc=456,all_foc=1,
nmrk_l=20,nmrk_r=20)
#derived allele
bifurcation.diagram(haplohh_cgu_bta12,mrk_foc=456,all_foc=2,
nmrk_l=20,nmrk_r=20)
## 
dev.off()




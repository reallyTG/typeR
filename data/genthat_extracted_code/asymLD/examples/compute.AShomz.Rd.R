library(asymLD)


### Name: compute.AShomz
### Title: Compute allele specific homozygosity.
### Aliases: compute.AShomz

### ** Examples

library(asymLD)

# An example using haplotype frequencies from Wilson(2010)
data(hla.freqs)
hla.dr_dq <- hla.freqs[hla.freqs$locus1=="DRB1" & hla.freqs$locus2=="DQB1",]
compute.ALD(hla.dr_dq)
compute.AShomz(hla.dr_dq, sort.var=c("focal","allele"), sort.asc=c(TRUE,TRUE))
compute.AShomz(hla.dr_dq, sort.var=c("focal","allele.freq"), sort.asc=c(FALSE,FALSE))
# Note that there is substantially less variablity (higher ALD) for HLA*DQB1
# conditional on HLA*DRB1 than for HLA*DRB1 conditional on HLA*DQB1, indicating
# that the overall variation for DQB1 is relatively low given specific DRB1 alleles.
# The largest contributors to ALD{DQB1|DRB1} are the DRB1*0301 and DRB1*1501 focal
# alleles, which have high allele frequencies and also have high allele specific
# homozygosity values.




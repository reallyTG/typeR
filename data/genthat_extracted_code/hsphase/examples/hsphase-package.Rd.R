library(hsphase)


### Name: hsphase-package
### Title: Phasing, Pedigree Reconstruction, Sire Imputation and
###   Recombination Events Identification for Half-sib Families
### Aliases: hsphase-package hsphase
### Keywords: block,half-sib,sire inference,phase

### ** Examples

genotype <- matrix(c(
  0,0,0,0,1,2,2,2,0,0,2,0,0,0,
  2,2,2,2,1,0,0,0,2,2,2,2,2,2,
  2,2,2,2,1,2,2,2,0,0,2,2,2,2,
  2,2,2,2,0,0,0,0,2,2,2,2,2,2,
  0,0,0,0,0,2,2,2,2,2,2,0,0,0), ncol = 14, byrow = TRUE) 
ssp(bmh(genotype), genotype)
aio(genotype)
imageplot(bmh(genotype), title = "ImagePlot example")
rplot(genotype, c(1:14))




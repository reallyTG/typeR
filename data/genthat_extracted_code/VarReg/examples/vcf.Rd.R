library(VarReg)


### Name: vcf
### Title: vcf dataset.
### Aliases: vcf
### Keywords: datasets

### ** Examples

library(VarReg)
data(vcf)
attach(vcf)
plot(rowMeans(vcf[-1]),vcf$vcflong-vcf$vcfshort)




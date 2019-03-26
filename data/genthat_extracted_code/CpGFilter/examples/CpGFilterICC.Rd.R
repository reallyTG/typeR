library(CpGFilter)


### Name: CpGFilterICC
### Title: CpG filtering method based on intra-class correlation
###   coefficients.
### Aliases: CpGFilterICC
### Keywords: EWAS ICC LMM

### ** Examples

require(CpGFilter)
# 10 samples replicated twice, 5 samples replicated four times.
rep.design <- c(1:100, 101:110, 101:110, 111:115, 111:115, 111:115, 111:115)
rho <- CpGFilterICC(matrix(rnorm(140*1000), 1000, 140), rep.design, logit=FALSE)




library(heritability)


### Name: heritability-package
### Title: Marker-Based Estimation of Heritability Using Individual Plant
###   or Plot Data.
### Aliases: heritability-package heritability
### Keywords: heritability mixed model

### ** Examples

# A) marker-based estimation of heritability, given individual plant-data
# and a marker-based relatedness matrix:
data(LDV)
data(K_atwell)
# This may take up to 30 sec.
#out1 <- marker_h2(data.vector=LDV$LDV,geno.vector=LDV$genotype,
#                  covariates=LDV[,4:8],K=K_atwell)
#
# B) marker-based estimation of heritability, given genotypic means
# and a marker-based relatedness matrix:
data(means_LDV)
data(R_matrix_LDV)
data(K_atwell)
out2 <- marker_h2_means(data.vector=means_LDV$LDV,geno.vector=means_LDV$genotype,
                        K=K_atwell,Dm=R_matrix_LDV)
#
# C) estimation of repeatability using ANOVA:
data(LDV)
out3 <- repeatability(data.vector=LDV$LDV,geno.vector= LDV$genotype,
                      covariates.frame=as.data.frame(LDV[,3]))




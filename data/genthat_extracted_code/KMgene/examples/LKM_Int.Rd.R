library(KMgene)


### Name: LKM_Int
### Title: KM for Traits by Time Interaction in Longitudinal GWAS Data
### Aliases: LKM_Int

### ** Examples

######################################################################################
### Examples for Marker by Time Interaction in Longitudinal Continuous Traits in GWAS
######################################################################################
###################
# Data using KM ###
###################
data("LKM_numID_int")
pvalue1 <- LKM_Int(phenotype=lkm_int_n_y$y, genotypes=lkm_int_n_gene, time=lkm_int_n_y$time,
yid=lkm_int_n_y$id, gid=lkm_int_n_gid$gid, covariates=NULL, append.write="./pvalues.out")




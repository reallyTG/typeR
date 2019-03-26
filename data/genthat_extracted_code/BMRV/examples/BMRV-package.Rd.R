library(BMRV)


### Name: BMRV-package
### Title: Bayesian models for rare variant association analysis
### Aliases: BMRV-package BMRV
### Keywords: package

### ** Examples

data(blvcm_data)
temp<- blvcm(blvcm_data$pheno_data, blvcm_data$geno_data[,1:3], iter=10000, model = 3)




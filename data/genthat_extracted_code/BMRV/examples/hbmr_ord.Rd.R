library(BMRV)


### Name: hbmr_ord
### Title: Hierarchical Bayesian multiple regression model incorporating
###   genotype uncertainty (HBMR) for ordinal traits
### Aliases: hbmr_ord
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(hbmr_bin_data)
hbmr_ord(hbmr_bin_data$pheno[1:500], hbmr_bin_data$geno[1:500,1:3], fam=1, 
kin= hbmr_bin_data$kin[1:500,1:500], iter=800, burnin=200)




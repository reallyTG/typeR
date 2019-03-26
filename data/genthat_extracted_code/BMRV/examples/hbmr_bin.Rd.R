library(BMRV)


### Name: hbmr_bin
### Title: Hierarchical Bayesian multiple regression model incorporating
###   genotype uncertainty (HBMR) for binary traits
### Aliases: hbmr_bin
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(hbmr_bin_data)
hbmr_bin(hbmr_bin_data$pheno[1:500], hbmr_bin_data$geno[1:500,1:3], fam=1, 
kin= hbmr_bin_data$kin[1:500,1:500], iter=800, burnin=200)




library(BMRV)


### Name: hbmr
### Title: Hierarchical Bayesian multiple regression model incorporating
###   genotype uncertainty (HBMR)
### Aliases: hbmr
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(hbmr_data)
hbmr(hbmr_data$pheno_data, hbmr_data$geno_data[,1:3], hbmr_data$qual_data[,1:3], 
iter=10000, burnin=1000)




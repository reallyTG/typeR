library(BMRV)


### Name: blvcm_bin
### Title: Bayesian latent variable collapsing model (BLVCM) for binary
###   data with probit link
### Aliases: blvcm_bin
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(blvcm_bin_data)
blvcm_bin(blvcm_bin_data$pheno, blvcm_bin_data$geno[,1:3], iter=5000, burnin=500, model=2)





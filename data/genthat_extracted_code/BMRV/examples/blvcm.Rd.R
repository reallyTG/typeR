library(BMRV)


### Name: blvcm
### Title: Bayesian latent variable collapsing model (BLVCM)
### Aliases: blvcm
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(blvcm_data)
blvcm(blvcm_data$pheno, blvcm_data$geno[,1:3], iter=10000, burnin=1000, model=3)





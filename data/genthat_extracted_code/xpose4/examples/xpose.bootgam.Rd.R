library(xpose4)


### Name: xpose.bootgam
### Title: Title
### Aliases: xpose.bootgam

### ** Examples


## filter out occasion as a covariate as only one value
all_covs <- xvardef("covariates",simpraz.xpdb)
some_covs <- all_covs[!(all_covs %in% "OCC") ] 

## here only running n=5 replicates to see that things work
##   use something like n=100 for resonable results
boot_gam_obj <- xpose.bootgam(simpraz.xpdb,5,parnam="KA",covnams=some_covs,seed=1234)





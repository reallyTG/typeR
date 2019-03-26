library(mmod)


### Name: chao_bootstrap
### Title: Produce bootstrap samples from each subpopulation of a genind
###   object
### Aliases: chao_bootstrap

### ** Examples

## Not run: 
##D   
##D data(nancycats)
##D obs.D <- D_Jost(nancycats)
##D bs <- chao_bootstrap(nancycats)
##D bs_D <- summarise_bootstrap(bs, D_Jost)
##D bias <- bs.D$summary.global.het[1] - obs.D$global.het
##D bs.D$summary.global.het - bias
## End(Not run)




library(brainGraph)


### Name: IndividualContributions
### Title: Approaches to estimate individual network contribution
### Aliases: IndividualContributions loo aop

### ** Examples

## Not run: 
##D IC <- loo(resids.all, corrs)
##D RC <- loo(resids.all, corrs, level='regional')
## End(Not run)
## Not run: 
##D IC <- aop(resids.all, corrs[[1]]$R)
##D RC <- aop(resids.all, corrs[[1]]$R, level='regional')
## End(Not run)




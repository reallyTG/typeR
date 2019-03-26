library(COUNT)


### Name: fishing
### Title: fishing
### Aliases: fishing
### Keywords: datasets

### ** Examples



## Not run: 
##D library(MASS)
##D library(flexmix)
##D data(fishing)
##D attach(fishing)
##D fmm_pg <- flexmix(totabund~meandepth + offset(log(sweptarea)), data=rwm1984, k=2,
##D          model=list(FLXMRglm(totabund~., family="NB1"), 
##D                     FLXMRglm(tpdocvis~., family="NB1")))
##D parameters(fmm_pg, component=1, model=1)
##D parameters(fmm_pg, component=2, model=1)
##D summary(fmm_pg)
## End(Not run)



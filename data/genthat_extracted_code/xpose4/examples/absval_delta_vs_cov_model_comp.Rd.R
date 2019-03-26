library(xpose4)


### Name: absval_delta_vs_cov_model_comp
### Title: Model comparison plots, of absolute differences in
###   goodness-of-fit predictors against covariates, for Xpose 4
### Aliases: absval_delta_vs_cov_model_comp absval.dcwres.vs.cov.model.comp
###   absval.dipred.vs.cov.model.comp absval.diwres.vs.cov.model.comp
###   absval.dpred.vs.cov.model.comp absval.dwres.vs.cov.model.comp
### Keywords: methods

### ** Examples


## Not run: 
##D ## We expect to find the required NONMEM run and table files for runs
##D ## 5 and 6 in the current working directory
##D xpdb5 <- xpose.data(5)
##D xpdb6 <- xpose.data(6)
##D 
##D ## A basic dWRES plot, without prompts
##D absval.dwres.vs.cov.model.comp(xpdb5, xpdb6)
##D 
##D ## Custom colours and symbols, no user IDs
##D absval.dpred.vs.cov.model.comp(xpdb5, xpdb6, cex=0.6, pch=8, col=1, ids=NULL)
## End(Not run)






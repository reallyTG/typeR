library(nmaINLA)


### Name: meta_inla
### Title: Fitting a pairwise meta-analysis model using INLA.
### Aliases: meta_inla

### ** Examples

data('TBdat')
## Create the dataset suitable for INLA
TBdatINLA <- create_INLA_dat_pair(TBdat$TRT, TBdat$CON, TBdat$TRTTB, TBdat$CONTB)

## Fitting a random-effects model using arm-level approach
## Not run: 
##D if(requireNamespace('INLA', quietly = TRUE)){
##D  require('INLA', quietly = TRUE)
##D fit.TB.RE.INLA <- meta_inla(TBdatINLA, type = 'RE', approach = 'arm-level',
##D tau.prior = 'uniform', tau.par = c(0, 5))
##D }
## End(Not run)





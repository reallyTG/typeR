library(nmaINLA)


### Name: nma_inla
### Title: Fitting a network meta-analysis model using INLA
### Aliases: nma_inla

### ** Examples

SmokdatINLA <- create_INLA_dat(dat = Smokdat, armVars = c('treatment' = 't', 'responders' = 'r'
,'sampleSize' = 'n'), nArmsVar = 'na')
## Not run: 
##D ## Fitting a consistency model
##D if(requireNamespace('INLA', quietly = TRUE)){
##D  require('INLA', quietly = TRUE)
##D fit.Smok.cons.INLA <- nma_inla(SmokdatINLA, likelihood = 'binomial', type = 'consistency',
##D tau.prior = 'uniform', tau.par = c(0, 5))
##D }
## End(Not run)





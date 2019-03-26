library(CDM)


### Name: eval_likelihood
### Title: Evaluation of Likelihood
### Aliases: eval_likelihood prep_data_long_format

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Likelihood data.ecpe
##D #############################################################################
##D 
##D data(data.ecpe, package="CDM")
##D dat <- data.ecpe$dat[,-1]
##D Q <- data.ecpe$q.matrix
##D 
##D #*** store data matrix in long format
##D data_long <- CDM::prep_data_long_format(data)
##D str(data_long)
##D 
##D #** estimate GDINA model
##D mod <- CDM::gdina(dat, q.matrix=Q)
##D summary(mod)
##D 
##D #** extract data, item response functions and prior
##D data <- CDM::IRT.data(mod)
##D irfprob <- CDM::IRT.irfprob(mod)
##D prob_theta <- attr( irfprob, "prob.theta")
##D 
##D #** compute likelihood
##D lmod <- CDM::eval_likelihood(data=data, irfprob=irfprob)
##D max( abs( lmod - CDM::IRT.likelihood(mod) ))
##D 
##D #** compute posterior
##D pmod <- CDM::eval_likelihood(data=data, irfprob=irfprob, prior=prob.theta,
##D             normalization=TRUE)
##D max( abs( pmod - CDM::IRT.posterior(mod) ))
## End(Not run)




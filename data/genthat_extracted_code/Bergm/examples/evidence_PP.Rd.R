library(Bergm)


### Name: evidence_PP
### Title: Evidence estimation via power posteriors
### Aliases: evidence_PP

### ** Examples

## Not run: 
##D # Load the florentine marriage network:
##D data(florentine)
##D 
##D flo.formula <- flomarriage ~ edges + kstar(2)
##D 
##D info.adjustPL <- adjustPL(formula = flo.formula,
##D                           aux.iters    = 100, 
##D                           noisy.nsim   = 50,   
##D                           noisy.thin   = 50,   
##D                           ladder       = 30,   
##D                           estimate     = "MLE",
##D                           control      = control.ergm(MCMC.samplesize=2000))
##D 
##D                          
##D # Specify location and shape of prior distribution: 
##D prior.mean  <- rep(0, 2)
##D prior.sigma <- diag(5, 2)   
##D 
##D pp.est.evidence <- evidence_PP(formula = flo.formula,
##D                                prior.mean = prior.mean,   
##D                                prior.sigma = prior.sigma,
##D                                nits = 10000,
##D                                burnin = 2000,
##D                                temps = seq(0, 1, length.out = 20)^5,
##D                                info.adjustPL = info.adjustPL)
##D                                    
##D # MCMC diagnostics and posterior summaries:
##D bergm.output(pp.est.evidence)
##D   
##D # Log-marginal likelihood estimate:             
##D pp.est.evidence$log.evidence
## End(Not run)





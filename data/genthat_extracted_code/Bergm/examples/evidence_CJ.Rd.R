library(Bergm)


### Name: evidence_CJ
### Title: Evidence estimation via Chib and Jeliazkov's method
### Aliases: evidence_CJ

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
##D # Specify a prior distribution: 
##D mean.priors  <- rep(0, 2)
##D sigma.priors <- diag(5, 2)          
##D                                                 
##D # MCMC sampling and evidence estimation:
##D Chib.est.evidence <- evidence_CJ(formula      = flo.formula,
##D                                  prior.mean   = mean.priors,   
##D                                  prior.sigma  = sigma.priors,
##D                                  nits         = 30000,
##D                                  burnin       = 5000,
##D                                  thin         = 1,
##D                                  num.samples  = 25000,
##D                                  tunePL       = 2,
##D                                  info.adjustPL = info.adjustPL)                         
##D                                    
##D # MCMC diagnostics and posterior summaries:
##D bergm.output(Chib.est.evidence)
##D   
##D # Log-marginal likelihood estimate:             
##D Chib.est.evidence$log.evidence
## End(Not run)





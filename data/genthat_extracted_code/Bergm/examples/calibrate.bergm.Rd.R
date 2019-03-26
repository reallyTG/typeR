library(Bergm)


### Name: calibrate.bergm
### Title: Calibrating misspecified Bayesian ERGMs
### Aliases: calibrate.bergm

### ** Examples

## Not run: 
##D # Load the florentine marriage network
##D data(florentine)
##D                                  
##D # Calibrated pseudo-posterior:
##D 
##D cpp.flo <- calibrate.bergm(flomarriage ~ edges + kstar(2),
##D                            aux.iters = 3000,
##D                            mcmc = 10000,  
##D                            burnin = 500,
##D                            tunePL = 2.5)
##D                                                    
##D # MCMC diagnostics and posterior summaries:
##D 
##D bergm.output(cpp.flo)
##D 
##D # Bayesian goodness-of-fit test:
##D 
##D bgof(cpp.flo,
##D      aux.iters = 500,
##D      sample.size = 50,
##D      n.deg = 10,
##D      n.dist = 9,
##D      n.esp = 6)
## End(Not run)





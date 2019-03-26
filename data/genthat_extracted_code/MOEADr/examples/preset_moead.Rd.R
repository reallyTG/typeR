library(MOEADr)


### Name: preset_moead
### Title: preset_moead
### Aliases: preset_moead

### ** Examples


# Generate list of available presets
preset_moead(name = NULL)

## Not run: 
##D   library(smoof) # < Install package smoof if needed
##D   ZDT1 <- make_vectorized_smoof(prob.name  = "ZDT1",
##D                                 dimensions = 30)
##D                                 problem   <- list(name       = "ZDT1",
##D                                                   xmin       = rep(0, 30),
##D                                                   xmax       = rep(1, 30),
##D                                                   m          = 2)
##D 
##D   # Get preset configuration for original MOEA/D
##D   configuration <- preset_moead("original")
##D 
##D   # Modify whatever you fancy:
##D   stopcrit <- list(list(name = "maxiter", maxiter = 50))
##D   showpars <- list(show.iters = "dots", showevery  = 10)
##D   seed     <- 42
##D 
##D   output <- moead(problem  = problem,
##D                   preset   = configuration,
##D                   showpars = showpars,
##D                   stopcrit = stopcrit,
##D                   seed     = seed)
## End(Not run)





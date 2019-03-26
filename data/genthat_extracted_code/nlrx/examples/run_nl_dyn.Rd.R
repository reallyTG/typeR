library(nlrx)


### Name: run_nl_dyn
### Title: Execute NetLogo simulation without pregenerated parametersets
### Aliases: run_nl_dyn

### ** Examples

## Not run: 
##D 
##D # Load nl object form test data:
##D nl <- nl_lhs
##D 
##D # Add genalg simdesign:
##D nl@simdesign <- simdesign_GenAlg(nl=nl,
##D                                   popSize = 200,
##D                                   iters = 100,
##D                                   evalcrit = 1,
##D                                   nseeds = 1)
##D 
##D # Run simulations:
##D results <- run_nl_dyn(nl)
##D 
## End(Not run)




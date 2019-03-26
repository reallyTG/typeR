library(nlrx)


### Name: run_nl_all
### Title: Execute all NetLogo simulations from a nl object
### Aliases: run_nl_all

### ** Examples

## Not run: 
##D 
##D # Load nl object from test data:
##D nl <- nl_lhs
##D 
##D # Execute all simulations from an nl object with properly attached simdesign.
##D results <- run_nl_all(nl)
##D 
##D # Run in parallel on local machine:
##D library(future)
##D plan(multisession)
##D results %<-% run_nl_all(nl)
##D 
## End(Not run)




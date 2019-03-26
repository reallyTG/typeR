library(crunch)


### Name: derivations
### Title: Get or set a derived variable's expression
### Aliases: derivations derivation derivation<-
###   derivation,CrunchVariable-method
###   derivation<-,CrunchVariable,ANY-method
###   derivation<-,CrunchVariable,NULL-method
###   is.derived,CrunchVariable-method is.derived
###   is.derived<-,CrunchVariable,logical-method is.derived<-

### ** Examples

## Not run: 
##D 
##D ds$derived_v1 <- ds$v1 + 5
##D 
##D derivation(ds$derived_v1)
##D # Crunch expression: v1 + 5
##D 
##D derivation(ds$derived_v1) <- ds$v1 + 10
##D derivation(ds$derived_v1)
##D # Crunch expression: v1 + 10
##D 
##D is.derived(ds$derived_v1)
##D # TRUE
##D 
##D # to integrate or instantiate the variable in place (remove the link between
##D # variable v1 and the derivation) you can:
##D derivation(ds$derived_v1) <- NULL
##D 
##D # after integrating, the derived variable is no longer derived.
##D is.derived(ds$derived_v1)
##D # FALSE
## End(Not run)




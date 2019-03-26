library(GDINA)


### Name: personparm
### Title: calculate person (incidental) parameters
### Aliases: personparm

### ** Examples

## Not run: 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D fit <- GDINA(dat = dat, Q = Q, model = "GDINA")
##D # EAP
##D head(personparm(fit))
##D # MAP
##D head(personparm(fit, what = "MAP"))
## End(Not run)





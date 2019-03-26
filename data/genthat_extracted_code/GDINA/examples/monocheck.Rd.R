library(GDINA)


### Name: monocheck
### Title: This function checks if monotonicity is violated
### Aliases: monocheck

### ** Examples

## Not run: 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D 
##D 
##D mod1 <- GDINA(dat = dat, Q = Q, model = "GDINA")
##D check <- monocheck(mod1)
##D check
##D mod2 <- GDINA(dat = dat, Q = Q, model = "GDINA",mono.constraint = check)
##D check2 <- monocheck(mod2)
##D check2
## End(Not run)




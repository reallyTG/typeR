library(rvalues)


### Name: npmixapply
### Title: Apply Functions over estimated unit-specific posterior
###   distributions
### Aliases: npmixapply
### Keywords: hstat

### ** Examples

## Not run: 
##D data(hiv)
##D npobj <- npmle(hiv, family = gaussian, maxiter = 4)
##D 
##D ### Compute unit-specific posterior means
##D pmean <- npmixapply(npobj, function(x) { x })
##D 
##D ### Compute post. prob that \theta_i < .1
##D pp <- npmixapply(npobj, function(x) { x < .1})
## End(Not run)




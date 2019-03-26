library(bnlearn)


### Name: rbn
### Title: Simulate random data from a given Bayesian network
### Aliases: rbn rbn.bn rbn.bn.fit
### Keywords: inference simulation

### ** Examples

## Not run: 
##D data(learning.test)
##D res = gs(learning.test)
##D res = set.arc(res, "A", "B")
##D par(mfrow = c(1,2))
##D plot(res)
##D sim = rbn(res, 500, learning.test)
##D plot(gs(sim))
## End(Not run)



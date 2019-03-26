library(ergm.count)


### Name: zach
### Title: Karate club social network of Zachary (1977)
### Aliases: zach
### Keywords: datasets

### ** Examples

data(zach)

oldpal <- palette()
palette(gray((1:8)/8))
plot(zach, vertex.col="role", displaylabels=TRUE, edge.col="contexts")
palette(oldpal)

## No test: 
# Fit a binomial-reference ERGM.

zach.fit1 <- ergm(zach~nonzero+sum+nodefactor("role",base=2)+absdiffcat("faction.id"),
                  response="contexts", reference=~Binomial(8),
                  control=control.ergm(MCMLE.trustregion=1000))

mcmc.diagnostics(zach.fit1)

summary(zach.fit1)
## End(No test)
## Not run: 
##D # This is much slower.
##D zach.fit2 <- ergm(zach~nonzero+sum+nodefactor("role",base=2)+transitiveties,
##D                   response="contexts", reference=~Binomial(8),
##D                   control=control.ergm(MCMLE.trustregion=1000),
##D                   eval.loglik=FALSE)
##D 
##D mcmc.diagnostics(zach.fit2)
##D 
##D summary(zach.fit2)
## End(Not run)




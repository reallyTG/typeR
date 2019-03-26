library(extRemes)


### Name: return.level
### Title: Return Level Estimates
### Aliases: return.level return.level.fevd return.level.fevd.bayesian
###   return.level.fevd.lmoments return.level.fevd.mle
###   return.level.ns.fevd.bayesian return.level.ns.fevd.mle
###   print.return.level
### Keywords: distribution methods

### ** Examples

z <- revd(100, loc=20, scale=0.5, shape=-0.2)
fit <- fevd(z)
fit

return.level(fit)

fitLM <- fevd(z, method="Lmoments")
fitLM
return.level(fitLM)

## Not run: 
##D fitB <- fevd(z, method="Bayesian", verbose=TRUE)
##D fitB
##D 
##D return.level(fitB)
##D 
## End(Not run)




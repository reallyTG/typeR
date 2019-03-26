library(nimble)


### Name: buildMCEM
### Title: Builds an MCEM algorithm from a given NIMBLE model
### Aliases: buildMCEM

### ** Examples

## Not run: 
##D pumpCode <- nimbleCode({ 
##D  for (i in 1:N){
##D      theta[i] ~ dgamma(alpha,beta);
##D      lambda[i] <- theta[i]*t[i];
##D      x[i] ~ dpois(lambda[i])
##D  }
##D  alpha ~ dexp(1.0);
##D  beta ~ dgamma(0.1,1.0);
##D })
##D 
##D pumpConsts <- list(N = 10,
##D               t = c(94.3, 15.7, 62.9, 126, 5.24,
##D                 31.4, 1.05, 1.05, 2.1, 10.5))
##D 
##D pumpData <- list(x = c(5, 1, 5, 14, 3, 19, 1, 1, 4, 22))
##D 
##D pumpInits <- list(alpha = 1, beta = 1,
##D              theta = rep(0.1, pumpConsts$N))
##D pumpModel <- nimbleModel(code = pumpCode, name = 'pump', constants = pumpConsts,
##D                   data = pumpData, inits = pumpInits)
##D 
##D # Want to maximize alpha and beta (both which must be positive) and integrate over theta
##D box = list( list(c('alpha','beta'), c(0, Inf)))
##D 
##D pumpMCEM <- buildMCEM(model = pumpModel, latentNodes = 'theta[1:10]',
##D                        boxConstraints = box)
##D MLEs <- pumpMCEM$run(initM = 1000)
##D cov <- pumpMCEM$estimateCov()
## End(Not run)
# Could also use latentNodes = 'theta' and buildMCEM() would figure out this means 'theta[1:10]'





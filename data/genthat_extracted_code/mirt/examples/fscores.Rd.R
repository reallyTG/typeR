library(mirt)


### Name: fscores
### Title: Compute factor score estimates (a.k.a, ability estimates, latent
###   trait estimates, etc)
### Aliases: fscores
### Keywords: factor.scores

### ** Examples


mod <- mirt(Science, 1)
tabscores <- fscores(mod, full.scores = FALSE)
head(tabscores)

## Not run: 
##D fullscores <- fscores(mod)
##D fullscores_with_SE <- fscores(mod, full.scores.SE=TRUE)
##D head(fullscores)
##D head(fullscores_with_SE)
##D 
##D #change method argument to use MAP estimates
##D fullscores <- fscores(mod, method='MAP')
##D head(fullscores)
##D 
##D #calculate MAP for a given response vector
##D fscores(mod, method='MAP', response.pattern = c(1,2,3,4))
##D #or matrix
##D fscores(mod, method='MAP', response.pattern = rbind(c(1,2,3,4), c(2,2,1,3)))
##D 
##D # return only the scores and their SEs
##D fscores(mod, method='MAP', response.pattern = c(1,2,3,4),
##D   append_response.pattern=FALSE)
##D 
##D #use custom latent variable properties (diffuse prior for MAP is very close to ML)
##D fscores(mod, method='MAP', cov = matrix(1000), full.scores = FALSE)
##D fscores(mod, method='ML', full.scores = FALSE)
##D 
##D # EAPsum table of values based on total scores
##D fscores(mod, method = 'EAPsum', full.scores = FALSE)
##D 
##D #WLE estimation, run in parallel using available cores
##D mirtCluster()
##D head(fscores(mod, method='WLE', full.scores = FALSE))
##D 
##D #multiple imputation using 30 draws for EAP scores. Requires information matrix
##D mod <- mirt(Science, 1, SE=TRUE)
##D fs <- fscores(mod, MI = 30)
##D head(fs)
##D 
##D # plausible values for future work
##D pv <- fscores(mod, plausible.draws = 5)
##D lapply(pv, function(x) c(mean=mean(x), var=var(x), min=min(x), max=max(x)))
##D 
##D ## define a custom_den function. EAP with a uniform prior between -3 and 3
##D fun <- function(Theta, ...) as.numeric(dunif(Theta, min = -3, max = 3))
##D head(fscores(mod, custom_den = fun))
##D 
##D # custom MAP prior: standard truncated normal between 5 and -2
##D library(msm)
##D # need the :: scope for parallel to see the function (not require if no mirtCluster() defined)
##D fun <- function(Theta, ...) msm::dtnorm(Theta, mean = 0, sd = 1, lower = -2, upper = 5)
##D head(fscores(mod, custom_den = fun, method = 'MAP', full.scores = FALSE))
##D 
## End(Not run)




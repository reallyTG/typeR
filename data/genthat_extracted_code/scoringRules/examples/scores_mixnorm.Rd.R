library(scoringRules)


### Name: scores_mixnorm
### Title: Calculating scores for a mixture of normal distributions.
### Aliases: scores_mixnorm crps_mixnorm crps_mixnorm_int logs_mixnorm
###   dss_mixnorm

### ** Examples


# Example 1: 100 observations, 15 mixture components
mval <- matrix(rnorm(100*15), nrow = 100)
sdval <- matrix(rgamma(100*15, shape = 2), nrow = 100)
weights <- matrix(rep(1/15, 100*15), nrow = 100)
y <- rnorm(100)
crps1 <- crps_mixnorm(y = y, m = mval, s = sdval, w = weights)
crps2 <- crps_mixnorm_int(y = y, m = mval, s = sdval, w = weights)

## Not run: 
##D # Example 2: 2 observations, 10000 mixture components
##D mval <- matrix(rnorm(2*10000), nrow = 2)
##D sdval <- matrix(rgamma(2*10000, shape = 2), nrow = 2)
##D weights <- matrix(rep(1/10000, 2*10000), nrow = 2)
##D y <- rnorm(2)
##D # With many mixture components, numerical integration is much faster
##D system.time(crps1 <- crps_mixnorm(y = y, m = mval, s = sdval, w = weights))
##D system.time(crps2 <- crps_mixnorm_int(y = y, m = mval, s = sdval, w = weights))
## End(Not run)




library(mirt)


### Name: marginal_rxx
### Title: Function to calculate the marginal reliability
### Aliases: marginal_rxx
### Keywords: reliability

### ** Examples



dat <- expand.table(deAyala)
mod <- mirt(dat, 1)

# marginal estimate
marginal_rxx(mod)

## Not run: 
##D 
##D # empirical estimate (assuming the same prior)
##D fscores(mod, returnER = TRUE)
##D 
##D # empirical rxx the alternative way, given theta scores and SEs
##D fs <- fscores(mod, full.scores.SE=TRUE)
##D head(fs)
##D empirical_rxx(fs)
##D 
## End(Not run)




library(mirt)


### Name: empirical_rxx
### Title: Function to calculate the empirical (marginal) reliability
### Aliases: empirical_rxx
### Keywords: reliability

### ** Examples


## Not run: 
##D 
##D dat <- expand.table(deAyala)
##D mod <- mirt(dat, 1)
##D 
##D theta_se <- fscores(mod, full.scores.SE = TRUE)
##D empirical_rxx(theta_se)
##D 
##D theta_se <- fscores(mod, full.scores.SE = TRUE, method = 'ML')
##D empirical_rxx(theta_se)
##D 
## End(Not run)




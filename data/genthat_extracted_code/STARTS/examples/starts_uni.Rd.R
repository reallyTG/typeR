library(STARTS)


### Name: starts_uni
### Title: Functions for the Univariate STARTS Model
### Aliases: starts_uni_cov starts_cov starts_sim1dim starts_uni_estimate
###   starts_uni starts_uni_sim summary.starts_uni plot.starts_uni
###   logLik.starts_uni coef.starts_uni vcov.starts_uni

### ** Examples

library(sirt)

#############################################################################
# EXAMPLE 1: STARTS model specification using starts_uni_estimate
#############################################################################

## use simulated dataset according to Luedtke et al. (2017)

data(data.starts01a, package="STARTS")
dat <- data.starts01a

#--- covariance matrix and number of observations
covmat <- stats::cov( dat[, paste0("E",1:5) ] )
nobs <- nrow(dat)

#*** Model 1a: STARTS model with ML estimation
mod1a <- STARTS::starts_uni_estimate( covmat=covmat, nobs=nobs)
summary(mod1a)

## Not run: 
##D #- estimate model based on input data
##D mod1a1 <- STARTS::starts_uni_estimate( data=dat[, paste0("E",1:5) ])
##D summary(mod1a1)
##D 
##D #*** Model 1b: STARTS model with penalized ML estimation using the default priors
##D mod1b <- STARTS::starts_uni_estimate( covmat=covmat, nobs=nobs, estimator="PML")
##D summary(mod1b)
##D 
##D #*** Model 1c: STARTS model with MCMC estimation and default priors
##D set.seed(987)
##D mod1c <- STARTS::starts_uni_estimate( covmat=covmat, nobs=nobs, estimator="MCMC")
##D 
##D # assess convergence
##D plot(mod1c)
##D # summary
##D summary(mod1c)
##D # extract more information
##D logLik(mod1c)
##D coef(mod1c)
##D vcov(mod1c)
##D 
##D #*** Model 1d: MCMC estimation with different prior distributions
##D mod1d <- STARTS::starts_uni_estimate( covmat=covmat, nobs=nobs, estimator="MCMC",
##D              prior_var_trait=c(10, 0.5), prior_var_ar=c(10, 0.3),
##D              prior_var_state=c(10, 0.2), prior_a=c(1, 0.5) )
##D summary(mod1d)
##D 
##D #*** Model 2: remove autoregressive process
##D mod2 <- STARTS::starts_uni_estimate( covmat=covmat, nobs=nobs, est_var_ar=FALSE)
##D summary(mod2)
##D 
##D #*** Model 3: remove stable trait factor
##D mod3 <- STARTS::starts_uni_estimate( covmat=covmat, nobs=nobs, est_var_trait=FALSE)
##D summary(mod3)
##D 
##D #*** Model 4: remove state variance from the model
##D mod4 <- STARTS::starts_uni_estimate( covmat=covmat, nobs=nobs, est_var_state=FALSE)
##D summary(mod4)
## End(Not run)




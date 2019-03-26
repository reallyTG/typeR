library(scoringRules)


### Name: ar_ms
### Title: Bayesian analysis of a Markov Switching autoregressive model
### Aliases: ar_ms

### ** Examples

## Not run: 
##D # Use GDP data from 2014Q4 edition
##D data(gdp)
##D dat <- subset(gdp, vint == "2014Q4")
##D y <- dat$val[order(dat$dt)]
##D 
##D # Fit model, using the default settings 
##D set.seed(816)
##D fit <- ar_ms(y)
##D 
##D # Histograms of parameter draws
##D par(mfrow = c(2, 2))
##D hist(fit$pars[,1], main = "Intercept (state-invariant)", xlab = "")
##D hist(fit$pars[,2], main = "AR(1) term (state-invariant)", xlab = "")
##D hist(1/fit$pars[,3], main = "Residual variance in 1st state", xlab = "")
##D hist(1/fit$pars[,4], main = "Residual variance in 2nd state", xlab = "")
##D 
##D # By construction, the residual variance is smaller in the 1st than in the 2nd state:
##D print(mean(1/fit$pars[,3] < 1/fit$pars[,4]))
## End(Not run)




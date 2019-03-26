library(icenReg)


### Name: ic_bayes
### Title: Bayesian Regression Models for Interval Censored Data
### Aliases: ic_bayes

### ** Examples

data(miceData)

flat_prior_model <- ic_bayes(cbind(l, u) ~ grp, data = miceData)
# Default behavior is flat prior

priorFxn <- function(pars){
 ans <- 0
 ans <- ans + dnorm(pars[1], log = TRUE)
 ans <- ans + dnorm(pars[3], sd = 0.25, log = TRUE)
}
# Prior function puts N(0,1) prior on baseline shape parameter (first parameter)
# flat prior on baseline scale parameter (second parameter)
# and N(0,0.25) on regression parameter (third parameter)

inform_prior_fit <- ic_bayes(cbind(l, u) ~ grp, 
                             data = miceData,
                             logPriorFxn = priorFxn)

summary(flat_prior_model)
summary(inform_prior_fit)
# Note tight prior on the regression pulls posterior mean toward 0





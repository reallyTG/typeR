library(prevalence)


### Name: truePrevMulti2
### Title: Estimate true prevalence from individuals samples using multiple
###   tests - covariance scheme
### Aliases: truePrevMulti2

### ** Examples

## Not run: 
##D ## ===================================================== ##
##D ## 2-TEST EXAMPLE: Strongyloides                         ##
##D ## ----------------------------------------------------- ##
##D ## Two tests were performed on 162 humans                ##
##D ## -> T1 = stool examination                             ##
##D ## -> T2 = serology test                                 ##
##D ## Expert opinion generated the following priors:        ##
##D ## -> SE1 ~ dbeta( 4.44, 13.31)                          ##
##D ## -> SP1 ~ dbeta(71.25,  3.75)                          ##
##D ## -> SE2 ~ dbeta(21.96,  5.49)                          ##
##D ## -> SP2 ~ dbeta( 4.10,  1.76)                          ##
##D ## The following results were obtained:                  ##
##D ## -> 38 samples T1+,T2+                                 ##
##D ## ->  2 samples T1+,T2-                                 ##
##D ## -> 87 samples T1-,T2+                                 ##
##D ## -> 35 samples T1-,T2-                                 ##
##D ## ===================================================== ##
##D 
##D ## how is the 2-test model defined?
##D define_x(2)
##D define_prior2(2)
##D 
##D ## fit Strongyloides 2-test model
##D ## a first model assumes conditional independence
##D ## -> set covariance terms to zero
##D strongy_indep <-
##D truePrevMulti2(
##D   x = c(38, 2, 87, 35),
##D   n = 162,
##D   prior = {
##D     TP ~ dbeta(1, 1)
##D     SE[1] ~ dbeta( 4.44, 13.31)
##D     SP[1] ~ dbeta(71.25,  3.75)
##D     SE[2] ~ dbeta(21.96,  5.49)
##D     SP[2] ~ dbeta( 4.10,  1.76)
##D     a[1] <- 0
##D     b[1] <- 0
##D   })
##D 
##D ## show model results
##D strongy_indep
##D 
##D ## fit same model using 'list-style'
##D strongy_indep <-
##D truePrevMulti2(
##D   x = c(38, 2, 87, 35),
##D   n = 162,
##D   prior =
##D     list(
##D       TP = list(dist = "beta", alpha = 1, beta = 1),
##D       SE1 = list(dist = "beta", alpha = 4.44, beta = 13.31),
##D       SP1 = list(dist = "beta", alpha = 71.25, beta = 3.75),
##D       SE2 = list(dist = "beta", alpha = 21.96, beta = 5.49),
##D       SP2 = list(dist = "beta", alpha = 4.10, beta = 1.76),
##D       a1 = 0,
##D       b1 = 0
##D     )
##D   )
##D 
##D ## show model results
##D strongy_indep
##D 
##D ## fit Strongyloides 2-test model
##D ## a second model allows for conditional dependence
##D ## -> a[1] is the covariance between T1 and T2, given D+
##D ## -> b[1] is the covariance between T1 and T2, given D-
##D ## -> a[1] and b[1] can range between +/- 2^-h, ie, (-.25, .25)
##D strongy <-
##D truePrevMulti2(
##D   x = c(38, 2, 87, 35),
##D   n = 162,
##D   prior = {
##D     TP ~ dbeta(1, 1)
##D     SE[1] ~ dbeta( 4.44, 13.31)
##D     SP[1] ~ dbeta(71.25,  3.75)
##D     SE[2] ~ dbeta(21.96,  5.49)
##D     SP[2] ~ dbeta( 4.10,  1.76)
##D     a[1] ~ dunif(-0.25, 0.25)
##D     b[1] ~ dunif(-0.25, 0.25)
##D   })
##D 
##D ## explore model structure
##D str(strongy)         # overall structure
##D str(strongy@par)     # structure of slot 'par'
##D str(strongy@mcmc)    # structure of slot 'mcmc'
##D strongy@model        # fitted model
##D strongy@diagnostics  # DIC, BGR and Bayes-P values
##D 
##D ## standard methods
##D print(strongy)
##D summary(strongy)
##D par(mfrow = c(2, 2))
##D plot(strongy)           # shows plots of TP by default
##D plot(strongy, "SE[1]")  # same plots for SE1
##D plot(strongy, "SE[2]")  # same plots for SE2
##D plot(strongy, "SP[1]")  # same plots for SP1
##D plot(strongy, "SP[2]")  # same plots for SP2
##D plot(strongy, "a[1]")   # same plots for a[1]
##D plot(strongy, "b[1]")   # same plots for b[1]
##D 
##D ## coda plots of all parameters
##D par(mfrow = c(2, 4)); densplot(strongy, col = "red")
##D par(mfrow = c(2, 4)); traceplot(strongy)
##D par(mfrow = c(2, 4)); gelman.plot(strongy)
##D par(mfrow = c(2, 4)); autocorr.plot(strongy)
## End(Not run)



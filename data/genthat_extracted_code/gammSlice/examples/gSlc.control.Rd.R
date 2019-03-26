library(gammSlice)


### Name: gSlc.control
### Title: Controlling generalized additive mixed model fitting via slice
###   sampling
### Aliases: gSlc.control

### ** Examples

## Not run: 
##D library(gammSlice)
##D set.seed(39402) ; m <- 100 ; n <- 2
##D beta0True <- 0.5 ; betaxTrue <- 1.7 ; sigsqTrue <- 0.8
##D idnum <- rep(1:m,each=n) ; x <- runif(m*n)
##D U <- rep(rnorm(m,0,sqrt(sigsqTrue)),each=n)
##D mu <- 1/(1+exp(-(beta0True+betaxTrue*x+U)))
##D y <- rbinom((m*n),1,mu)
##D fit <- gSlc(y ~ x,random = list(idnum = ~1),family = "binomial")
##D summary(fit)
##D 
##D # Illustration of user-specified priors:
##D 
##D fitMyPriors <- gSlc(y ~ x,random = list(idnum = ~1), 
##D                     family = "binomial", 
##D                     control = gSlc.control(fixedEffPriorVar=1e13, 
##D                                            sdPriorScale=1e3))
##D summary(fitMyPriors)
##D 
##D # Illustration of specification of larger Markov chain Monte Carlo samples:
##D 
##D fitBigMCMC <- gSlc(y ~ x,random = list(idnum = ~1),family = "binomial",
##D                    control = gSlc.control(nBurn=10000,nKept=8000,nThin=10))
##D summary(fitBigMCMC)
## End(Not run)




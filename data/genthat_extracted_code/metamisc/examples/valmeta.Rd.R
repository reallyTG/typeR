library(metamisc)


### Name: valmeta
### Title: Meta-analysis of prediction model performance
### Aliases: valmeta
### Keywords: calibration discrimination meta-analysis

### ** Examples

######### Validation of prediction models with a binary outcome #########
data(EuroSCORE)

# Meta-analysis of the c-statistic (random effects)
fit <- with(EuroSCORE, valmeta(cstat=c.index, cstat.se=se.c.index, 
                               cstat.95CI=cbind(c.index.95CIl,c.index.95CIu), 
                               N=n, O=n.events, slab=Study))
plot(fit)

# Nearly identical results when we need to estimate the SE
with(EuroSCORE, valmeta(cstat=c.index,  N=n, O=n.events, slab=Study))

# Two-stage meta-analysis of the total O:E ratio (random effects)
with(EuroSCORE, valmeta(measure="OE", O=n.events, E=e.events, N=n))    
with(EuroSCORE, valmeta(measure="OE", O=n.events, E=e.events))        
with(EuroSCORE, valmeta(measure="OE", Po=Po, Pe=Pe, N=n))

# One-stage meta-analysis of the total O:E ratio (random effects)
with(EuroSCORE, valmeta(measure="OE", O=n.events, E=e.events, method="ML",
                        pars=list(model.oe="poisson/log")))

## Not run: 
##D # Bayesian random effects meta-analysis of the c-statistic
##D fit2 <- with(EuroSCORE, valmeta(cstat=c.index, cstat.se=se.c.index, 
##D                                 cstat.95CI=cbind(c.index.95CIl,c.index.95CIu),
##D                                 N=n, O=n.events, method="BAYES", slab=Study))
##D 
##D # Bayesian one-stage random effects meta-analysis of the total O:E ratio
##D # Consider that some (but not all) studies do not provide information on N
##D # A Poisson distribution will be used for studies 1, 2, 5, 10 and 20
##D # A Binomial distribution will be used for the remaining studies
##D EuroSCORE.new <- EuroSCORE
##D EuroSCORE.new$n[c(1, 2, 5, 10, 20)] <-  NA
##D pars <- list(hp.tau.dist="dhalft",   # Prior for the between-study standard deviation
##D              hp.tau.sigma=1.5,       # Standard deviation for 'hp.tau.dist'
##D              hp.tau.df=3,            # Degrees of freedom for 'hp.tau.dist'
##D              hp.tau.max=10)          # Maximum value for the between-study standard deviation
##D fit3 <- with(EuroSCORE.new, valmeta(measure="OE", O=n.events, E=e.events, N=n, 
##D         method="BAYES", slab=Study, pars=pars, ret.fit = T))
##D plot(fit3)
##D print(fit3$fit$model) # Inspect the JAGS model
##D print(fit3$fit$data)  # Inspect the JAGS data
## End(Not run) 

######### Validation of prediction models with a time-to-event outcome #########
data(Framingham)

# Meta-analysis of total O:E ratio after 10 years of follow-up
with(Framingham, valmeta(measure="OE", Po=Po, Pe=Pe, N=n))





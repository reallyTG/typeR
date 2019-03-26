library(DPpackage)


### Name: DPbetabinom
### Title: Bayesian Semiparametric Beta-Binomial Model using a DP prior
### Aliases: DPbetabinom DPbetabinom.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     # Data
##D       data(rolling)
##D       y <- cbind(rolling$y1,rolling$y2)
##D 
##D 
##D     # Prior information
##D 
##D       prior<-list(alpha=1,
##D                   a1=1,
##D                   b1=1)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       mcmc <- list(nburn=5000,
##D                    nsave=10000,
##D                    nskip=3,
##D                    ndisplay=100)
##D 
##D     # Fitting the model
##D 
##D       fit <- DPbetabinom(y=y,ngrid=100, 
##D                          prior=prior, 
##D                          mcmc=mcmc, 
##D                          state=state, 
##D                          status=TRUE)
##D 
##D       fit
##D       summary(fit)
##D 
##D     # density estimate
##D       plot(fit,output="density")
##D 
##D     # parameters
##D       plot(fit,output="param")
## End(Not run)




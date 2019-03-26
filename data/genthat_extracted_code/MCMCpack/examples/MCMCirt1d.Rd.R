library(MCMCpack)


### Name: MCMCirt1d
### Title: Markov Chain Monte Carlo for One Dimensional Item Response
###   Theory Model
### Aliases: MCMCirt1d
### Keywords: models

### ** Examples


   ## Not run: 
##D    ## US Supreme Court Example with inequality constraints
##D    data(SupremeCourt)
##D    posterior1 <- MCMCirt1d(t(SupremeCourt),
##D                    theta.constraints=list(Scalia="+", Ginsburg="-"),
##D                    B0.alpha=.2, B0.beta=.2,
##D                    burnin=500, mcmc=100000, thin=20, verbose=500,
##D                    store.item=TRUE)
##D    geweke.diag(posterior1)
##D    plot(posterior1)
##D    summary(posterior1)
##D 
##D    ## US Senate Example with equality constraints
##D    data(Senate)
##D    Sen.rollcalls <- Senate[,6:677]
##D    posterior2 <- MCMCirt1d(Sen.rollcalls,
##D                     theta.constraints=list(KENNEDY=-2, HELMS=2),
##D                     burnin=2000, mcmc=100000, thin=20, verbose=500)
##D    geweke.diag(posterior2)
##D    plot(posterior2)
##D    summary(posterior2)
##D    
## End(Not run)





library(MCMCpack)


### Name: MCMCirtKd
### Title: Markov Chain Monte Carlo for K-Dimensional Item Response Theory
###   Model
### Aliases: MCMCirtKd
### Keywords: models

### ** Examples


   ## Not run: 
##D    data(SupremeCourt)
##D    # note that the rownames (the item names) are "1", "2", etc
##D    posterior1 <- MCMCirtKd(t(SupremeCourt), dimensions=1,
##D                    burnin=5000, mcmc=50000, thin=10,
##D                    B0=.25, store.item=TRUE,
##D                    item.constraints=list("1"=list(2,"-")))
##D    plot(posterior1)
##D    summary(posterior1)
##D 
##D 
##D    data(Senate)
##D    Sen.rollcalls <- Senate[,6:677]
##D    posterior2 <- MCMCirtKd(Sen.rollcalls, dimensions=2,
##D                    burnin=5000, mcmc=50000, thin=10,
##D                    item.constraints=list(rc2=list(2,"-"), rc2=c(3,0),
##D                                          rc3=list(3,"-")),
##D                    B0=.25)
##D    plot(posterior2)
##D    summary(posterior2)
##D    
## End(Not run)





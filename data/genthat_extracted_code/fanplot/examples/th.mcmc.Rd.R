library(fanplot)


### Name: th.mcmc
### Title: 1000 MCMC Simulations of Estimated Volatility from Pound Dollar
###   Exchange Rate Data.
### Aliases: th.mcmc
### Keywords: datasets

### ** Examples

## Not run: 
##D # empty plot
##D plot(NULL, type = "n", xlim = c(1, 945), ylim = range(th.mcmc), ylab = "Theta")
##D 
##D # add fan
##D fan(th.mcmc)
##D 
##D ##
##D ##Create your own (longer) MCMC sample:
##D ##
##D library("tsbugs")
##D library("R2OpenBUGS")
##D # write model file:
##D my1.bug <- dget(system.file("model", "my1.R", package = "fanplot"))
##D write.model(my1.bug, "my1.txt")
##D # take a look:
##D file.show("my1.txt")
##D # run openbugs, remember to include theta as a param otherwise will not
##D # have anything to plot
##D my1.mcmc<-bugs(data=list(n=length(svpdx$pdx),y=svpdx$pdx), 
##D                inits=list(list(phistar=0.975,mu=0,itau2=50)),
##D                param=c("mu","phi","tau","theta"), 
##D                model="my1.txt",
##D                n.iter=11000, n.burnin=1000, n.chains=1)
##D                
##D th.mcmc <- my1.mcmc$sims.list$theta
## End(Not run)




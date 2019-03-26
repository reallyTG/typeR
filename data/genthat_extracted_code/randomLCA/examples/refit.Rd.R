library(randomLCA)


### Name: refit
### Title: Refit an randomLCA object
### Aliases: refit refit.randomLCA
### Keywords: methods

### ** Examples

## Not run: 
##D myocardial.lca1 <- randomLCA(myocardial[,1:4],freq=myocardial$freq,nclass=1)
##D myocardial.lca2 <- randomLCA(myocardial[,1:4],freq=myocardial$freq)
##D # calculate observed lrt
##D obslrt <- 2*(logLik(myocardial.lca2)-logLik(myocardial.lca1))
##D 
##D print(obslrt)
##D 
##D nsims <- 999
##D # generate the simulations
##D thesims <- simulate(myocardial.lca1, nsims)
##D # for each simulation determin lrt
##D simlrt <- rep(NA,nsims)
##D for (isim in 1:nsims) {
##D   submodel <- refit(myocardial.lca1,newpatterns=thesims[[isim]])
##D   fullmodel <- refit(myocardial.lca2,newpatterns=thesims[[isim]])
##D   simlrt[isim] <- 2*(logLik(fullmodel)-logLik(submodel))
##D   print(c(isim,simlrt[isim]))
##D }
##D # calculate p value as proportion of simulated lrt greater than observed,
##D # corrected by adding one to numerator and denominator
##D print((sum(simlrt>=obslrt)+1)/(nsims+1))
## End(Not run)




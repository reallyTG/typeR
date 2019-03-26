library(pomp)


### Name: Particle Markov Chain Monte Carlo
### Title: The particle Markov chain Metropolis-Hastings algorithm
### Aliases: pmcmc pmcmc,missing-method pmcmc,ANY-method pmcmc,pmcmc-method
###   pmcmc-pmcmc pmcmc,pfilterd.pomp-method pmcmc-pfilterd.pomp
###   pmcmc,pomp-method pmcmc-pomp continue,pmcmc-method continue-pmcmc
###   pmcmc-class pmcmc-methods logLik,pmcmc-method logLik-pmcmc
###   logLik,pmcmcList-method logLik-pmcmcList conv.rec,pmcmc-method
###   conv.rec-pmcmc conv.rec,pmcmcList-method conv.rec-pmcmcList
###   filter.traj,pmcmc-method filter.traj,pmcmcList-method
###   filter.traj-pmcmc filter.traj-pmcmcList plot-pmcmc plot,pmcmc-method
###   plot-pmcmcList plot,pmcmcList-method pmcmcList-class
###   covmat,pmcmc-method covmat-pmcmc covmat,pmcmcList-method
###   covmat-pmcmcList c-pmcmc c,pmcmc-method c-pmcmcList
###   c,pmcmcList-method [-pmcmcList [,pmcmcList-method
### Keywords: ts

### ** Examples

## Not run: 
##D library(pomp)
##D 
##D pompExample(ou2)
##D 
##D pmcmc(
##D       pomp(ou2,dprior=Csnippet("
##D    lik = dnorm(alpha_2,-0.5,1,1) + dnorm(alpha_3,0.3,1,1);
##D    lik = (give_log) ? lik : exp(lik);"),
##D            paramnames=c("alpha.2","alpha.3")),
##D       Nmcmc=2000,Np=500,verbose=TRUE,
##D       proposal=mvn.rw.adaptive(rw.sd=c(alpha.2=0.01,alpha.3=0.01),
##D         scale.start=200,shape.start=100)) -> chain
##D continue(chain,Nmcmc=2000,proposal=mvn.rw(covmat(chain))) -> chain
##D plot(chain)
##D chain <- pmcmc(chain)
##D plot(chain)
##D 
##D library(coda)
##D trace <- window(conv.rec(chain,c("alpha.2","alpha.3")),start=2000)
##D rejectionRate(trace)
##D effectiveSize(trace)
##D autocorr.diag(trace)
##D 
##D summary(trace)
##D plot(trace)
##D 
##D heidel.diag(trace)
##D geweke.diag(trace)
## End(Not run)




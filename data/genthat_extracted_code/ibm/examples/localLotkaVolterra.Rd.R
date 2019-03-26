library(ibm)


### Name: localLotkaVolterra
### Title: Lotka-Volterra with local predation interactions
### Aliases: localLotkaVolterra
### Keywords: Lotka-volterra interactions local

### ** Examples

## Not run: 
##D set.seed(880820)
##D par = list(alpha=5e-4, beta=5e-4, r=0.1, m=0.05, D=list(N=8e-5, P=8e-5), 
##D L=list(N=0.2, P=0.2))
##D N0 = with(par, m/(2*beta*L$P))
##D P0 = with(par, r/(2*alpha*L$N))
##D par$initial = list(N=round(N0), P=round(P0))
##D sim = localLotkaVolterra(par, T=240, replicates=100, maxpop = 1e4)
##D plot(sim)
## End(Not run) 




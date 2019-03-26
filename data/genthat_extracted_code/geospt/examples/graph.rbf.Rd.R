library(geospt)


### Name: graph.rbf
### Title: Graph that describes the behavior of the optimized _eta_ and
###   _rho_ parameters, associated with a radial basis function
### Aliases: graph.rbf
### Keywords: spatial

### ** Examples

data(preci)
coordinates(preci)<-~x+y
# optimizing eta
graph.rbf(prec~1, preci, eta.opt=TRUE, rho.opt=FALSE, n.neigh=9, func="TPS", 
    np=40, eta.dmax=0.2, P.T=TRUE)
## Not run: 
##D # optimizing rho
##D graph.rbf(prec~x+y, preci, eta.opt=FALSE, rho.opt=TRUE, n.neigh=9, func="M", 
##D     np=20, rho.dmax=2, P.T=TRUE)
##D # optimizing eta and rho
##D tps.lo <- graph.rbf(prec~1, preci, eta.opt=TRUE, rho.opt=TRUE, n.neigh=9, func="TPS", 
##D     eta.dmax=2, rho.dmax=2, x0=c(0.1,0.1), iter=40)
##D tps.lo$Opt  # best combination of eta and rho obtained
##D # other optimization options
##D opt.u <- uobyqa(c(0.1,0.1), rbf.cv1, control = list(maxfun=40), formula=prec~1, data=preci, 
##D                 n.neigh=9, func="TPS")
##D opt.n <- newuoa(c(0.1,0.1), rbf.cv1, control = list(maxfun=40), formula=prec~1, data=preci, 
##D                 n.neigh=9, func="TPS")
##D # lattice of RMSPE values associated with a range of eta and rho, without optimization
##D tps.l <- graph.rbf(prec~1, preci, eta.opt=FALSE, rho.opt=FALSE, n.neigh=9, func="TPS", 
##D     np=10, eta.dmax=2, rho.dmax=2)
##D tps.l$opt.table  # best combination of eta and rho obtained from lattice
##D tps.ls$pplot     # lattice of RMSPE
## End(Not run)




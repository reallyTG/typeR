library(geosptdb)


### Name: graph.rbfST
### Title: Graph that describes the behavior of the optimized _eta_ and
###   _rho_ parameters, associated with a spatio-temporal radial basis
###   function.
### Aliases: graph.rbfST
### Keywords: spatial

### ** Examples

## Not run: 
##D data(croatiadb)
##D coordinates(croatiadb)<-~x+y
##D # optimizing eta
##D graph.rbfST(MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, data=croatiadb, eta.opt=TRUE, 
##D              rho.opt=FALSE, n.neigh=30, func="TPS", np=40,  eta.dmax=2, P.T=TRUE)
##D # optimizing rho
##D graph.rbfST(MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, data=croatiadb, eta.opt=FALSE, 
##D              rho.opt=TRUE, n.neigh=30, func="M", np=20, rho.dmax=2, P.T=TRUE)
##D # optimizing eta and rho
##D tps.lo <- graph.rbfST(MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, data=croatiadb, 
##D        eta.opt=TRUE,rho.opt=TRUE, n.neigh=25, func="TPS",  eta.dmax=0.2, 
##D        rho.dmax=0.2, xo=c(0.1,0.1), iter=50)
##D tps.lo  # best combination of eta and rho obtained
##D # lattice of RMSPE values associated with a range of eta and rho, without optimization
##D tps.la <- graph.rbfST(MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, data=croatiadb, 
##D        eta.opt=FALSE, rho.opt=FALSE, n.neigh=30,  func="TPS", np=10,  eta.dmax=0.2, 
##D        rho.dmax=0.2)
##D tps.l$table  # best combination of eta and rho obtained
##D tps.l$spplot  # lattice of RMSPE
## End(Not run)




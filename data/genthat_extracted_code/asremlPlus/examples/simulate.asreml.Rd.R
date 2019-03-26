library(asremlPlus)


### Name: simulate.asreml
### Title: Produce sets of simulated data from a multivariate normal
###   distribtion and save quantites related to the simulated data
### Aliases: simulate.asreml
### Keywords: hplot dplot asreml

### ** Examples
## Not run: 
##D data(Wheat.dat)
##D current.asr <- asreml(yield ~ Rep + WithinColPairs + Variety, 
##D                       random = ~ Row + Column + units,
##D                       residual = ~ ar1(Row):ar1(Column), 
##D                       data=Wheat.dat)
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D current.asrt <- rmboundary.asrtests(current.asrt)
##D # Form variance matrix based on estimated variance parameters
##D s2 <- current.asr$sigma2
##D gamma.Row <- current.asr$gammas[1]
##D gamma.unit <- current.asr$gammas[2]
##D rho.r <- current.asr$gammas[4]
##D rho.c <- current.asr$gammas[5]
##D row.ar1 <- mat.ar1(order=10, rho=rho.r)
##D col.ar1 <- mat.ar1(order=15, rho=rho.c)
##D V <- gamma.Row * fac.sumop(Wheat.dat$Row) + 
##D      gamma.unit * diag(1, nrow=150, ncol=150) + 
##D      mat.dirprod(col.ar1, row.ar1)
##D V <- s2*V
##D 
##D #Produce residuals from 100 simulated data sets
##D resid <- simulate(current.asr, V=V, which="residuals", ncores = 2)
## End(Not run)



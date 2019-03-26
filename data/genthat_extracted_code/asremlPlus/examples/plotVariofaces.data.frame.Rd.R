library(asremlPlus)


### Name: plotVariofaces.data.frame
### Title: Plots empirical variogram faces, including envelopes, from
###   supplied residuals as described by Stefanova, Smith & Cullis (2009).
### Aliases: plotVariofaces.data.frame plotVariofaces
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
##D   gamma.unit * diag(1, nrow=150, ncol=150) + 
##D   mat.dirprod(col.ar1, row.ar1)
##D V <- s2*V
##D 
##D #Produce variogram faces plot (Stefanaova et al, 2009)
##D resid <- simulate(current.asr, V=V, which="residuals")
##D resid$residuals <- cbind(resid$observed[c("Row","Column")],
##D                          resid$residuals)
##D plotVariofaces(data=resid$observed[c("Row","Column","residuals")],
##D                residuals=resid$residuals, 
##D                restype="Standardized conditional residuals")
## End(Not run)



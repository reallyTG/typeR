library(MAINT.Data)


### Name: fasttle-methods
### Title: Methods for Function fasttle in Package 'MAINT.Data'
### Aliases: fasttle-methods fasttle,IData-method fasttle
### Keywords: methods trimmed maximum likelihood estimator interval data

### ** Examples


## Not run: 
##D 
##D # Create an Interval-Data object containing the intervals of temperatures by quarter 
##D # for 899 Chinese meteorological stations.
##D 
##D ChinaT <- IData(ChinaTemp[1:8])
##D 
##D # Estimate parameters by the fast trimmed maximum likelihood estimator, 
##D # using a two-step procedure to select the triming parameter, a reweighted 
##D # MCD estimate, and the classical 97.5% chi-squared quantile cut-offs.
##D 
##D Chinafasttle1 <- fasttle(ChinaT)
##D cat("China maximum trimmed likelihood estimation results =\n")
##D print(Chinafasttle1)
##D 
##D # Estimate parameters by the fast trimmed maximum likelihood estimator, using 
##D # the triming parameter that maximizes breakdown, and a reweighted MCD estimate 
##D # based on the 97.5% quantiles of Hardin and Rocke adjusted F distributions.
##D 
##D Chinafasttle2 <- fasttle(ChinaT,alpha=0.5,getalpha=FALSE,rawMD2Dist="HardRockeAdjF")
##D cat("China maximum trimmed likelihood estimation results =\n")
##D print(Chinafasttle2)
##D 
##D # Estimate parameters by the fast trimmed maximum likelihood estimator, using a two-step procedure
##D # to select the triming parameter, a reweighted MCD estimate based on Hardin and Rocke adjusted 
##D # F distributions, and 95% quantiles, and the Cerioli Beta and F distributions together
##D # with Cerioli iterated procedure to identify outliers in the first step.
##D 
##D Chinafasttle3 <- fasttle(ChinaT,rawMD2Dist="HardRockeAdjF",eta=0.05,MD2Dist="CerioliBetaF",
##D   multiCmpCor="iterstep")
##D cat("China maximum trimmed likelihood estimation results =\n")
##D print(Chinafasttle3)
##D 
## End(Not run)





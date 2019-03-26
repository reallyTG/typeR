library(MAINT.Data)


### Name: fulltle-methods
### Title: Methods for Function fulltle in Package 'MAINT.Data'
### Aliases: fulltle-methods fulltle,IData-method fulltle
### Keywords: methods trimmed maximum likelihood estimator interval data

### ** Examples



## Not run: 
##D 
##D # Create an Interval-Data object containing the intervals for characteristics 
##D # of 27 cars models.
##D 
##D CarsIdt <- IData(Cars[1:8],VarNames=c("Price","EngineCapacity","TopSpeed","Acceleration"))
##D 
##D #Display the first and last observations
##D 
##D print(head(CarsIdt))
##D 
##D print(tail(CarsIdt))
##D 
##D # Estimate parameters by the full trimmed maximum likelihood estimator, 
##D # using a two-step procedure to select the triming parameter, a reweighted 
##D # MCD estimate, and the classical 97.5% chi-squared quantile cut-offs.
##D 
##D CarsTE1 <- fulltle(CarsIdt)
##D cat("Cars data -- normal maximum trimmed likelhiood estimation results:\n")
##D print(CarsTE1)
##D 
##D # Estimate parameters by the full trimmed maximum likelihood estimator, using
##D # the triming parameter that maximizes breakdown, and a reweighted MCD estimate
##D # based on the 97.5% quantiles of Hardin and Rocke adjusted F distributions.
##D 
##D CarsTE2 <- fulltle(CarsIdt,alpha=0.5,getalpha=FALSE,rawMD2Dist="HardRockeAdjF")
##D cat("Cars data -- normal maximum trimmed likelhiood estimation results:\n")
##D print(CarsTE2)
##D 
##D # Estimate parameters by the full trimmed maximum likelihood estimator, using 
##D # a two-step procedure to select the triming parameter, and a reweighted MCD estimate 
##D # based on Hardin and Rocke adjusted F distributions, 95% quantiles, and 
##D # the Cerioli Beta and F distributions together with his iterated procedure 
##D # to identify outliers in the first step.
##D 
##D CarsTE3 <- fulltle(CarsIdt,rawMD2Dist="HardRockeAdjF",eta=0.05,MD2Dist="CerioliBetaF",
##D   multiCmpCor="iterstep")
##D cat("Cars data -- normal maximum trimmed likelhiood estimation results:\n")
##D print(CarsTE3)
##D 
## End(Not run)





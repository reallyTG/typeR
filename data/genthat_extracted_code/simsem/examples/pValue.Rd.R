library(simsem)


### Name: pValue
### Title: Find p-values (1 - percentile) by comparing a single analysis
###   output from the result object
### Aliases: pValue

### ** Examples

## Not run: 
##D # Compare an analysis result with a result of simulation study
##D library(lavaan)
##D loading <- matrix(0, 9, 3)
##D loading[1:3, 1] <- NA
##D loading[4:6, 2] <- NA
##D loading[7:9, 3] <- NA
##D targetmodel <- estmodel(LY=loading, modelType="CFA", indLab=paste("x", 1:9, sep=""))
##D out <- analyze(targetmodel, HolzingerSwineford1939)
##D 
##D loading.trivial <- matrix("runif(1, -0.2, 0.2)", 9, 3)
##D loading.trivial[is.na(loading)] <- 0
##D mismodel <- model.lavaan(out, std=TRUE, LY=loading.trivial)
##D 
##D # The actual number of replications should be much greater than 20.
##D simout <- sim(20, n=nrow(HolzingerSwineford1939), mismodel)
##D 
##D # Find the p-value comparing the observed fit indices against the simulated 
##D # sampling distribution of fit indices
##D pValue(out, simout)
## End(Not run)




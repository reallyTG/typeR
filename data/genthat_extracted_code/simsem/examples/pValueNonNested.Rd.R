library(simsem)


### Name: pValueNonNested
### Title: Find p-values (1 - percentile) for a non-nested model comparison
### Aliases: pValueNonNested

### ** Examples

## Not run: 
##D # Model A; Factor 1 --> Factor 2; Factor 2 --> Factor 3
##D library(lavaan)
##D loading <- matrix(0, 11, 3)
##D loading[1:3, 1] <- NA
##D loading[4:7, 2] <- NA
##D loading[8:11, 3] <- NA
##D path.A <- matrix(0, 3, 3)
##D path.A[2, 1] <- NA
##D path.A[3, 2] <- NA
##D model.A <- estmodel(LY=loading, BE=path.A, modelType="SEM", indLab=c(paste("x", 1:3, sep=""), 
##D 	paste("y", 1:8, sep="")))
##D 
##D out.A <- analyze(model.A, PoliticalDemocracy)
##D 
##D # Model A; Factor 1 --> Factor 3; Factor 3 --> Factor 2
##D path.B <- matrix(0, 3, 3)
##D path.B[3, 1] <- NA
##D path.B[2, 3] <- NA
##D model.B <- estmodel(LY=loading, BE=path.B, modelType="SEM", indLab=c(paste("x", 1:3, sep=""), 
##D 	paste("y", 1:8, sep="")))
##D 
##D out.B <- analyze(model.B, PoliticalDemocracy)
##D 
##D loading.mis <- matrix("runif(1, -0.2, 0.2)", 11, 3)
##D loading.mis[is.na(loading)] <- 0
##D 
##D # Create SimSem object for data generation and data analysis template
##D datamodel.A <- model.lavaan(out.A, std=TRUE, LY=loading.mis)
##D datamodel.B <- model.lavaan(out.B, std=TRUE, LY=loading.mis)
##D 
##D # Get sample size
##D n <- nrow(PoliticalDemocracy)
##D 
##D # The actual number of replications should be greater than 20.
##D output.A.A <- sim(20, n=n, model.A, generate=datamodel.A) 
##D output.A.B <- sim(20, n=n, model.B, generate=datamodel.A)
##D output.B.A <- sim(20, n=n, model.A, generate=datamodel.B)
##D output.B.B <- sim(20, n=n, model.B, generate=datamodel.B)
##D 
##D # Find the p-value comparing the observed fit indices against the simulated 
##D # sampling distribution of fit indices
##D 
##D pValueNonNested(out.A, out.B, output.A.A, output.A.B, output.B.A, output.B.B)
##D 
##D # If the p-value for model A is significant but the p-value for model B is not
##D # significant, model B is preferred.
## End(Not run)




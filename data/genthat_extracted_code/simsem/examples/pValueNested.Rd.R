library(simsem)


### Name: pValueNested
### Title: Find p-values (1 - percentile) for a nested model comparison
### Aliases: pValueNested

### ** Examples

## Not run: 
##D library(lavaan)
##D 
##D # Nested Model: Linear growth curve model
##D LY <- matrix(1, 4, 2)
##D LY[,2] <- 0:3
##D PS <- matrix(NA, 2, 2)
##D TY <- rep(0, 4)
##D AL <- rep(NA, 2)
##D TE <- diag(NA, 4)
##D nested <- estmodel(LY=LY, PS=PS, TY=TY, AL=AL, TE=TE, modelType="CFA", 
##D 	indLab=paste("t", 1:4, sep=""))
##D 
##D # Parent Model: Unconditional growth curve model
##D LY2 <- matrix(1, 4, 2)
##D LY2[,2] <- c(0, NA, NA, 3)
##D parent <- estmodel(LY=LY2, PS=PS, TY=TY, AL=AL, TE=TE, modelType="CFA", 
##D 	indLab=paste("t", 1:4, sep=""))
##D 
##D # Analyze the output
##D outNested <- analyze(nested, Demo.growth)
##D outParent <- analyze(parent, Demo.growth)
##D 
##D # Create data template from the nested model with small misfit on the linear curve
##D loadingMis <- matrix(0, 4, 2)
##D loadingMis[2:3, 2] <- "runif(1, -0.1, 0.1)"
##D datamodel <- model.lavaan(outNested, LY=loadingMis)
##D 
##D # Get the sample size
##D n <- nrow(Demo.growth)
##D 
##D # The actual replications should be much greater than 30.
##D simNestedNested <- sim(30, n=n, nested, generate=datamodel) 
##D simNestedParent <- sim(30, n=n, parent, generate=datamodel)
##D 
##D # Find the p-value comparing the observed fit indices against the simulated 
##D # sampling distribution of fit indices
##D pValueNested(outNested, outParent, simNestedNested, simNestedParent)
## End(Not run)




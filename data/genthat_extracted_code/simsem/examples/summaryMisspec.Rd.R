library(simsem)


### Name: summaryMisspec
### Title: Provide summary of the population misfit and
###   misspecified-parameter values across replications
### Aliases: summaryMisspec

### ** Examples

## Not run: 
##D path <- matrix(0, 4, 4)
##D path[3, 1:2] <- NA
##D path[4, 3] <- NA
##D pathVal <- matrix("", 4, 4)
##D pathVal[3, 1:2] <- "runif(1, 0.3, 0.5)"
##D pathVal[4, 3] <- "runif(1, 0.5, 0.7)"
##D pathMis <- matrix(0, 4, 4)
##D pathMis[4, 1:2] <- "runif(1, -0.1, 0.1)"
##D BE <- bind(path, pathVal, pathMis)
##D 
##D residual.error <- diag(4)
##D residual.error[1,2] <- residual.error[2,1] <- NA
##D RPS <- binds(residual.error, "rnorm(1, 0.3, 0.1)")
##D 
##D Path.Model <- model(RPS = RPS, BE = BE, modelType="Path")
##D 
##D # The number of replications in actual analysis should be much more than 5
##D ParamObject <- sim(5, n=200, Path.Model)
##D 
##D # Summarize the model misspecification that is specified in the 'pathMis' object
##D summaryMisspec(ParamObject)
## End(Not run)




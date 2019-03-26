library(simsem)


### Name: setPopulation
### Title: Set the data generation population model underlying an object
### Aliases: setPopulation

### ** Examples

# See each class for an example.
## Not run: 
##D # Data generation model
##D loading <- matrix(0, 7, 3)
##D loading[1:3, 1] <- NA
##D loading[4:6, 2] <- NA
##D loading[1:7, 3] <- NA
##D loadingVal <- matrix(0, 7, 3)
##D loadingVal[1:3, 1] <- "runif(1, 0.5, 0.7)"
##D loadingVal[4:6, 2] <- "runif(1, 0.5, 0.7)"
##D loadingVal[1:6, 3] <- "runif(1, 0.3, 0.5)"
##D loadingVal[7, 3] <- 1
##D loading.mis <- matrix("runif(1, -0.2, 0.2)", 7, 3)
##D loading.mis[is.na(loading)] <- 0
##D loading.mis[,3] <- 0
##D loading.mis[7,] <- 0
##D LY <- bind(loading, loadingVal, misspec=loading.mis)
##D 
##D RPS <- binds(diag(3))
##D 
##D path <- matrix(0, 3, 3)
##D path[2, 1] <- NA
##D BE <- bind(path, "runif(1, 0.3, 0.5)")
##D 
##D RTE <- binds(diag(7))
##D 
##D VY <- bind(c(rep(NA, 6), 0), c(rep(1, 6), ""))
##D 
##D datamodel <- model(LY=LY, RPS=RPS, BE=BE, RTE=RTE, VY=VY, modelType="SEM")
##D 
##D # Data analysis model
##D loading <- matrix(0, 7, 3)
##D loading[1:3, 1] <- NA
##D loading[4:6, 2] <- NA
##D loading[7, 3] <- NA
##D path <- matrix(0, 3, 3)
##D path[2, 1] <- NA
##D path[1, 3] <- NA
##D path[2, 3] <- NA
##D errorCov <- diag(NA, 7)
##D errorCov[7, 7] <- 0
##D facCov <- diag(3)
##D analysis <- estmodel(LY=loading, BE=path, TE=errorCov, PS=facCov, modelType="SEM", 
##D 	indLab=paste("y", 1:7, sep=""))
##D 
##D # In reality, more than 10 replications are needed.
##D Output <- sim(10, n=200, analysis, generate=datamodel)
##D 
##D # Population 
##D loadingVal <- matrix(0, 7, 3)
##D loadingVal[1:3, 1] <- 0.6
##D loadingVal[4:6, 2] <- 0.6
##D loadingVal[7, 3] <- 1
##D LY <- bind(loading, loadingVal)
##D pathVal <- matrix(0, 3, 3)
##D pathVal[2, 1] <- 0.4
##D pathVal[1, 3] <- 0.4
##D pathVal[2, 3] <- 0.4
##D BE <- bind(path, pathVal)
##D PS <- binds(facCov)
##D errorCovVal <- diag(0.64, 7)
##D errorCovVal[7, 7] <- 0
##D TE <- binds(errorCov, errorCovVal)
##D population <- model(LY=LY, PS=PS, BE=BE, TE=TE, modelType="SEM")
##D 
##D # Set up the new population
##D Output2 <- setPopulation(Output, population) 
##D 
##D # This summary will contain the bias information
##D summary(Output2)
## End(Not run)




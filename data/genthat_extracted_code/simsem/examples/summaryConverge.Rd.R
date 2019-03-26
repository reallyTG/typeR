library(simsem)


### Name: summaryConverge
### Title: Provide a comparison between the characteristics of convergent
###   replications and nonconvergent replications
### Aliases: summaryConverge

### ** Examples

## Not run: 
##D path.BE <- matrix(0, 4, 4)
##D path.BE[3, 1:2] <- NA
##D path.BE[4, 3] <- NA
##D starting.BE <- matrix("", 4, 4)
##D starting.BE[3, 1:2] <- "runif(1, 0.3, 0.5)"
##D starting.BE[4, 3] <- "runif(1, 0.5, 0.7)"
##D mis.path.BE <- matrix(0, 4, 4)
##D mis.path.BE[4, 1:2] <- "runif(1, -0.1, 0.1)"
##D BE <- bind(path.BE, starting.BE, misspec=mis.path.BE)
##D 
##D residual.error <- diag(4)
##D residual.error[1,2] <- residual.error[2,1] <- NA
##D RPS <- binds(residual.error, "rnorm(1, 0.3, 0.1)")
##D 
##D loading <- matrix(0, 12, 4)
##D loading[1:3, 1] <- NA
##D loading[4:6, 2] <- NA
##D loading[7:9, 3] <- NA
##D loading[10:12, 4] <- NA
##D mis.loading <- matrix("runif(1, -0.3, 0.3)", 12, 4)
##D mis.loading[is.na(loading)] <- 0
##D LY <- bind(loading, "runif(1, 0.7, 0.9)", misspec=mis.loading)
##D 
##D mis.error.cor <- matrix("rnorm(1, 0, 0.1)", 12, 12)
##D diag(mis.error.cor) <- 0
##D RTE <- binds(diag(12), misspec=mis.error.cor)
##D 
##D SEM.Model <- model(RPS = RPS, BE = BE, LY=LY, RTE=RTE, modelType="SEM")
##D 
##D n1 <- list(mean = 0, sd = 0.1)
##D chi5 <- list(df = 5)
##D 
##D facDist <- bindDist(c("chisq", "chisq", "norm", "norm"), chi5, chi5, n1, n1)
##D 
##D # In reality, more than 50 replications are needed.
##D simOut <- sim(50, n=500, SEM.Model, sequential=TRUE, facDist=facDist, estimator="mlr")
##D 
##D # Summary the convergent and nonconvergent replications
##D summaryConverge(simOut)
## End(Not run)




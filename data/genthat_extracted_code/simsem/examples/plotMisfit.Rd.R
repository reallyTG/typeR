library(simsem)


### Name: plotMisfit
### Title: Plot the population misfit in the result object
### Aliases: plotMisfit

### ** Examples

path.BE <- matrix(0, 4, 4)
path.BE[3, 1:2] <- NA
path.BE[4, 3] <- NA
starting.BE <- matrix("", 4, 4)
starting.BE[3, 1:2] <- "runif(1, 0.3, 0.5)"
starting.BE[4, 3] <- "runif(1, 0.5, 0.7)"
mis.path.BE <- matrix(0, 4, 4)
mis.path.BE[4, 1:2] <- "runif(1, -0.1, 0.1)"
BE <- bind(path.BE, starting.BE, misspec=mis.path.BE)

residual.error <- diag(4)
residual.error[1,2] <- residual.error[2,1] <- NA
RPS <- binds(residual.error, "rnorm(1, 0.3, 0.1)")

ME <- bind(rep(NA, 4), 0)

Path.Model <- model(RPS = RPS, BE = BE, ME = ME, modelType="Path")

# The number of replications in actual analysis should be much more than 20
Output <- sim(20, n=500, Path.Model)

# Plot the distribution of population misfit
plotMisfit(Output)

# Plot the relationship between population RMSEA and all misspecified direct effects
plotMisfit(Output, misParam=1:2)

# Plot the relationship between sample CFI and all misspecified direct effects 
plotMisfit(Output, usedFit="CFI", misParam=1:2)




library(surveillance)


### Name: algo.twins
### Title: Model fit based on a two-component epidemic model
### Aliases: algo.twins
### Keywords: ts regression

### ** Examples

## Not run: 
##D # Load the data used in the Held et al. (2006) paper
##D data("hepatitisA")
##D 
##D # Fix seed - this is used for the MCMC samplers in twins
##D set.seed(123)
##D 
##D # Call algorithm and save result (use short chain without filtering for speed)
##D otwins <- algo.twins(hepatitisA,
##D                      control=list(burnin=500, filter=1, sampleSize=1000))
##D 
##D # This shows the entire output (use ask=TRUE for pause between plots)
##D plot(otwins, ask=FALSE)
##D 
##D # Direct access to MCMC output
##D hist(otwins$logFile$psi,xlab=expression(psi),main="")
##D if (require("coda")) {
##D     print(summary(mcmc(otwins$logFile[,c("psi","xipsi","K")])))
##D }
## End(Not run)




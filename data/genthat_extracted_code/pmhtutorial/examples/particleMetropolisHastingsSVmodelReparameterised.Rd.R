library(pmhtutorial)


### Name: particleMetropolisHastingsSVmodelReparameterised
### Title: Particle Metropolis-Hastings algorithm for a stochastic
###   volatility model model
### Aliases: particleMetropolisHastingsSVmodelReparameterised
### Keywords: ts

### ** Examples

## Don't show: 
# Change to 2500 for better results but longer run times.
# The number here is only useful for code tests.
noIterations <- 10

# Create random data
y <- rnorm(10)

# Estimate the marginal posterior for phi
pmhOutput <- particleMetropolisHastingsSVmodelReparameterised(
  y, initialTheta = c(0, 0.9, 0.2), noParticles=50,
  noIterations=noIterations, stepSize=diag(c(0.05, 0.0002, 0.002)))

# Plot the estimate
nbins <- floor(sqrt(noIterations))
par(mfrow=c(3, 1))
hist(pmhOutput$theta[,1], breaks=nbins, main="", xlab=expression(mu),
  ylab="marginal posterior", freq=FALSE, col="#7570B3")
hist(pmhOutput$theta[,2], breaks=nbins, main="", xlab=expression(phi),
  ylab="marginal posterior", freq=FALSE, col="#E7298A")
hist(pmhOutput$theta[,3], breaks=nbins, main="",
  xlab=expression(sigma[v]), ylab="marginal posterior",
  freq=FALSE, col="#66A61E")
## End(Don't show)
## Not run: 
##D   # Get the data from Quandl
##D   library("Quandl")
##D   d <- Quandl("NASDAQOMX/OMXS30", start_date="2012-01-02",
##D               end_date="2014-01-02", type="zoo")
##D   y <- as.numeric(100 * diff(log(d$"Index Value")))
##D 
##D   # Estimate the marginal posterior for phi
##D   pmhOutput <- particleMetropolisHastingsSVmodelReparameterised(
##D     y, initialTheta = c(0, 0.9, 0.2), noParticles=500,
##D     noIterations=1000, stepSize=diag(c(0.05, 0.0002, 0.002)))
##D 
##D   # Plot the estimate
##D   nbins <- floor(sqrt(1000))
##D   par(mfrow=c(3, 1))
##D   hist(pmhOutput$theta[,1], breaks=nbins, main="", xlab=expression(mu),
##D     ylab="marginal posterior", freq=FALSE, col="#7570B3")
##D   hist(pmhOutput$theta[,2], breaks=nbins, main="", xlab=expression(phi),
##D     ylab="marginal posterior", freq=FALSE, col="#E7298A")
##D   hist(pmhOutput$theta[,3], breaks=nbins, main="",
##D     xlab=expression(sigma[v]), ylab="marginal posterior",
##D     freq=FALSE, col="#66A61E")
## End(Not run)




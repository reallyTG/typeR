library(pmhtutorial)


### Name: particleMetropolisHastings
### Title: Particle Metropolis-Hastings algorithm for a linear Gaussian
###   state space model
### Aliases: particleMetropolisHastings
### Keywords: ts

### ** Examples

## Don't show: 
  noIterations <- 10

  # Generates 100 observations from a linear state space model with
  # (phi, sigma_e, sigma_v) = (0.5, 1.0, 0.1) and zero initial state.
  theta <- c(0.5, 1.0, 0.1)
  d <- generateData(theta, noObservations=100, initialState=0.0) 

  # Estimate the marginal posterior for phi
  pmhOutput <- particleMetropolisHastings(d$y,
    initialPhi=0.1, sigmav=1.0, sigmae=0.1, noParticles=50, 
    initialState=0.0, noIterations=noIterations, stepSize=0.10)

  # Plot the estimate
  nbins <- floor(sqrt(noIterations))
  par(mfrow=c(1, 1))
  hist(pmhOutput, breaks=nbins, main="", xlab=expression(phi), 
    ylab="marginal posterior", freq=FALSE, col="#7570B3")
## End(Don't show)
## No test: 
  # Generates 100 observations from a linear state space model with
  # (phi, sigma_e, sigma_v) = (0.5, 1.0, 0.1) and zero initial state.
  theta <- c(0.5, 1.0, 0.1)
  d <- generateData(theta, noObservations=100, initialState=0.0) 

  # Estimate the marginal posterior for phi
  pmhOutput <- particleMetropolisHastings(d$y,
    initialPhi=0.1, sigmav=1.0, sigmae=0.1, noParticles=50, 
    initialState=0.0, noIterations=1000, stepSize=0.10)

  # Plot the estimate
  nbins <- floor(sqrt(1000))
  par(mfrow=c(1, 1))
  hist(pmhOutput, breaks=nbins, main="", xlab=expression(phi), 
    ylab="marginal posterior", freq=FALSE, col="#7570B3")
## End(No test)




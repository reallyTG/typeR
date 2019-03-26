library(pmhtutorial)


### Name: particleFilterSVmodel
### Title: Bootstrap particle filter for state estimate in a simple
###   stochastic volatility model
### Aliases: particleFilterSVmodel
### Keywords: ts

### ** Examples

## Don't show: 
  # Generate fake data
  y <- rnorm(100)

  # Estimate the filtered state using a particle filter
  theta <- c(-0.10, 0.97, 0.15)
  pfOutput <- particleFilterSVmodel(y, theta, noParticles=100)

  # Plot the estimate and the true state
  par(mfrow=c(2, 1))
  plot(y, type="l", xlab="time", ylab="log-returns", bty="n",
    col="#1B9E77")
  plot(pfOutput$xHatFiltered, type="l", xlab="time",
    ylab="estimate of log-volatility", bty="n", col="#D95F02")
## End(Don't show)
## Not run: 
##D   # Get the data from Quandl
##D   library("Quandl")
##D   d <- Quandl("NASDAQOMX/OMXS30", start_date="2012-01-02",
##D               end_date="2014-01-02", type="zoo")
##D   y <- as.numeric(100 * diff(log(d$"Index Value")))
##D 
##D   # Estimate the filtered state using a particle filter
##D   theta <- c(-0.10, 0.97, 0.15)
##D   pfOutput <- particleFilterSVmodel(y, theta, noParticles=100)
##D 
##D   # Plot the estimate and the true state
##D   par(mfrow=c(2, 1))
##D   plot(y, type="l", xlab="time", ylab="log-returns", bty="n",
##D     col="#1B9E77")
##D   plot(pfOutput$xHatFiltered, type="l", xlab="time",
##D     ylab="estimate of log-volatility", bty="n", col="#D95F02")
## End(Not run)




library(HyperbolicDist)


### Name: safeIntegrate
### Title: Safe Integration of One-Dimensional Functions
### Aliases: safeIntegrate print.integrate
### Keywords: math utilities

### ** Examples

integrate(dnorm, -1.96, 1.96)
safeIntegrate(dnorm, -1.96, 1.96)  # Same as for integrate()
integrate(dnorm, -Inf, Inf)
safeIntegrate(dnorm, -Inf, Inf)    # Same as for integrate()
integrate(dnorm, 1.96, 1.96)       # OK here but can give an error
safeIntegrate(dnorm, 1.96, 1.96)
integrate(dnorm, -Inf, -Inf)
safeIntegrate(dnorm, -Inf, -Inf)   # Avoids nonsense answer
integrate(dnorm, Inf, Inf)
safeIntegrate(dnorm, Inf, Inf)     # Avoids nonsense answer




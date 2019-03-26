library(mgarchBEKK)


### Name: BEKK
### Title: Estimate MGARCH-BEKK processes
### Aliases: BEKK

### ** Examples

## Simulate series:
simulated <- simulateBEKK(2, 1000, c(1,1))

## Prepare the matrix:
simulated <- do.call(cbind, simulated$eps)

## Estimate with default arguments:
estimated <- BEKK(simulated)

## Not run: 
##D ## Show diagnostics:
##D diagnoseBEKK(estimated)
## End(Not run)





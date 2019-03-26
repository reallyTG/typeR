library(R1magic)


### Name: mutualCoherence
### Title: Cumulative mutual coherence
### Aliases: mutualCoherence

### ** Examples

set.seed(42)
B <- matrix(rnorm(100), 10, 10) # Gaussian Random Matrix
mutualCoherence(B, 3) # mutual coherence up to order k




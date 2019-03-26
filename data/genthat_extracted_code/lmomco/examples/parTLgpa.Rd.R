library(lmomco)


### Name: parTLgpa
### Title: Estimate the Parameters of the Generalized Pareto Distribution
###   using Trimmed L-moments
### Aliases: parTLgpa
### Keywords: distribution (parameters) Distribution: Generalized Pareto

### ** Examples

TL <- TLmoms(rnorm(20),trim=1)
parTLgpa(TL)




library(lmomco)


### Name: parkap
### Title: Estimate the Parameters of the Kappa Distribution
### Aliases: parkap
### Keywords: distribution (parameters) Distribution: Kappa

### ** Examples

lmr <- lmoms(rnorm(20))
parkap(lmr)

## Not run: 
##D parkap(vec2lmom(c(0,1,.3,.8)), snap.tau4=TRUE) # Tau=0.8 is way above the GLO.
## End(Not run)




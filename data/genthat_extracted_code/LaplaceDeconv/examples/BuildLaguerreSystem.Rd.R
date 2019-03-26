library(LaplaceDeconv)


### Name: BuildLaguerreSystem
### Title: function BuildLaguerreSystem
### Aliases: BuildLaguerreSystem

### ** Examples

## Not run: 
##D 
##D  library(LaplaceDeconv)
##D  t = seq(0,10,l=50)
##D  g = exp(-5*t)
##D  # compute the elements needed for the Laplace deconvolution with kernel observations g at times t
##D  bFctLagMat = BuildLaguerreSystem(a=1/2,g,t,M=10)
##D  
## End(Not run)




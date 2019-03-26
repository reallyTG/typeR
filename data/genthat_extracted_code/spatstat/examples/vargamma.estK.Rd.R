library(spatstat)


### Name: vargamma.estK
### Title: Fit the Neyman-Scott Cluster Point Process with Variance Gamma
###   kernel
### Aliases: vargamma.estK
### Keywords: spatial models

### ** Examples

   ## Don't show: 
     u <- vargamma.estK(redwood, startpar=c(kappa=15, eta=0.075))
    
## End(Don't show)
    if(interactive()) {
      u <- vargamma.estK(redwood)
      u
      plot(u)
    }




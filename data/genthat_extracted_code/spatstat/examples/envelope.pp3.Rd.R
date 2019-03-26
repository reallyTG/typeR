library(spatstat)


### Name: envelope.pp3
### Title: Simulation Envelopes of Summary Function for 3D Point Pattern
### Aliases: envelope.pp3
### Keywords: spatial htest hplot iteration

### ** Examples

   X <- rpoispp3(20, box3())
 ## Not run: 
##D  plot(envelope(X, nsim=39))
##D  
## End(Not run)
 ## Don't show: 
  plot(envelope(X, nsim=4))
 
## End(Don't show)




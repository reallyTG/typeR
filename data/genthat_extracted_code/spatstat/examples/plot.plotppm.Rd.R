library(spatstat)


### Name: plot.plotppm
### Title: Plot a plotppm Object Created by plot.ppm
### Aliases: plot.plotppm
### Keywords: spatial hplot models

### ** Examples

 ## Not run: 
##D  m <- ppm(cells ~ 1, Strauss(0.05))
##D  mpic <- plot(m)
##D  # Perspective plot only, with altered parameters:
##D   plot(mpic,how="persp", theta=-30,phi=40,d=4)
##D  # All plots, with altered parameters for perspective plot:
##D  op <- spatstat.options(par.persp=list(theta=-30,phi=40,d=4))
##D  plot(mpic)
##D  # Revert
##D  spatstat.options(op)
##D  
## End(Not run)




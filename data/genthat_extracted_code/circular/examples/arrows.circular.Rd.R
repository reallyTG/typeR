library(circular)


### Name: arrows.circular
### Title: Add Arrows to a Circular Plot
### Aliases: arrows.circular
### Keywords: aplot hplot

### ** Examples

  plot(rvonmises(10, circular(0), kappa=1))
  arrows.circular(rvonmises(10, circular(0), kappa=1))
  arrows.circular(rvonmises(10, circular(0), kappa=1), y=runif(10), col=2)
  arrows.circular(rvonmises(10, circular(0), kappa=1), y=runif(10), 
    x0=runif(10, -1, 1), y0=runif(10, -1, 1), col=3)




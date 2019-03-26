library(spatstat)


### Name: periodify
### Title: Make Periodic Copies of a Spatial Pattern
### Aliases: periodify periodify.owin periodify.ppp periodify.psp
### Keywords: spatial manip

### ** Examples

  data(cells)
  plot(periodify(cells))
  a <- lapply(periodify(Window(cells), combine=FALSE),
        plot, add=TRUE,lty=2)





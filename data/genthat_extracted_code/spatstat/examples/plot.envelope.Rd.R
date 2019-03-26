library(spatstat)


### Name: plot.envelope
### Title: Plot a Simulation Envelope
### Aliases: plot.envelope
### Keywords: spatial hplot

### ** Examples

   data(cells)
   E <- envelope(cells, Kest, nsim=19)
   plot(E)
   plot(E, sqrt(./pi) ~ r)




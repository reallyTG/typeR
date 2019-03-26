library(spatstat)


### Name: dg.envelope
### Title: Global Envelopes for Dao-Genton Test
### Aliases: dg.envelope
### Keywords: spatial htest hplot iteration

### ** Examples

  ns <- if(interactive()) 19 else 4
  E <- dg.envelope(swedishpines, Lest, nsim=ns)
  E
  plot(E)
  Eo <- dg.envelope(swedishpines, Lest, alternative="less", nsim=ns)
  Ei <- dg.envelope(swedishpines, Lest, interpolate=TRUE, nsim=ns)




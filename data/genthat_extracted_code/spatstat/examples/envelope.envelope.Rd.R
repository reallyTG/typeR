library(spatstat)


### Name: envelope.envelope
### Title: Recompute Envelopes
### Aliases: envelope.envelope
### Keywords: spatial htest hplot iteration

### ** Examples

  E <- envelope(cells, Kest, nsim=19, savefuns=TRUE, savepatterns=TRUE)
  E2 <- envelope(E, nrank=2)
  Eg <- envelope(E, global=TRUE)
  EG <- envelope(E, Gest)
  EL <- envelope(E, transform=expression(sqrt(./pi)))




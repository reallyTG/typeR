library(spatstat)


### Name: as.data.frame.envelope
### Title: Coerce Envelope to Data Frame
### Aliases: as.data.frame.envelope
### Keywords: spatial manip

### ** Examples

  E <- envelope(cells, nsim=5, savefuns=TRUE)
  tail(as.data.frame(E))
  tail(as.data.frame(E, simfuns=TRUE))




library(spatstat)


### Name: nestsplit
### Title: Nested Split
### Aliases: nestsplit
### Keywords: spatial manip

### ** Examples

  # factor and tessellation
  Nft <- nestsplit(amacrine, marks(amacrine), quadrats(amacrine, 3, 1))
  Ntf <- nestsplit(amacrine, quadrats(amacrine, 3, 1), marks(amacrine))
  Ntf

  # two factors
  big <- with(marks(betacells), area > 300)
  Nff <- nestsplit(betacells, "type", factor(big))

  # two tessellations
  Tx <- quantess(redwood, "x", 4)
  Td <- dirichlet(runifpoint(5, Window(redwood)))
  Ntt <- nestsplit(redwood, Td, Tx)
  Ntt2 <- nestsplit(redwood, Td, ny=3)




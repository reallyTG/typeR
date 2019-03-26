library(spatstat)


### Name: pool.envelope
### Title: Pool Data from Several Envelopes
### Aliases: pool.envelope
### Keywords: spatial htest hplot iteration

### ** Examples

   E1 <- envelope(cells, Kest, nsim=10, savefuns=TRUE)
   E2 <- envelope(cells, Kest, nsim=20, savefuns=TRUE)
   pool(E1, E2)

   V1 <- envelope(E1, VARIANCE=TRUE)
   V2 <- envelope(E2, VARIANCE=TRUE)
   pool(V1, V2)




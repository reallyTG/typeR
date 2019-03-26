library(emulator)


### Name: toy
### Title: A toy dataset
### Aliases: toy
### Keywords: datasets

### ** Examples

     data(toy)
     real.relation <- function(x){sum( (1:6)*x )}

     d <- apply(toy, 1, real.relation)

     # Supply some scales:
     fish <- rep(2,6)

     # Calculate the A matrix:
     A <- corr.matrix(toy,scales=fish)
     Ainv <- solve(A)

     # Now add some suitably correlated noise:
     d.noisy <- as.vector(rmvnorm(n=1,mean=d, 0.1*A))

     # Choose a point:
     x.unknown <- rep(0.5,6)

     # Now use interpolant:
     interpolant(x.unknown, d.noisy, toy, Ainv, scales=fish, g=FALSE)


     # Now verify by checking the first row of toy:
     interpolant(toy[1,], d.noisy, toy, Ainv, scales=fish, g=FALSE)
     # Should match d.noisy[1].



